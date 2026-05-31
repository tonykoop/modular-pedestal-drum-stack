(* SPDX-License-Identifier: CERN-OHL-W-2.0
   Modular Pedestal Drum Stack — Acoustic First-Order Model
   Predicts membrane fundamental and first overtone for each of the
   five drumsEstimate, derives required head tension to hit target pitch,
   and estimates shell ring-mode coupling.

   First-order sanity check only. Do not treat predictionsEstimate as
   final pitch values — real heads have stiffness, the air load
   below an open shell shifts the fundamental ~3% down, and tuning
   uniformity around the rim has 5–10 cents of variance per rod. *)

(* Wolfram QA 2026-05-30: estimate - pending measurement, not fabrication authority.
   Variables and associations with Estimate suffix are planning values only unless
   later replaced by measured validation data or reviewed design-table authority. *)

ClearAll["Global`*"];

(* --- Constants ----------------------------------------------------- *)
a4 = 440.0;
freqMidi[m_] := a4 2^((m - 69)/12);
centsErr[meas_, target_] := 1200 Log[2, meas/target];

(* Bessel zeros for circular membrane modes (a, normal-modes table)
   m,n indexing: m angular nodes, n radial nodes.
   z[0,1] = fundamental, z[1,1] = first overtone (1.594 * f01), etc. *)
zBessel = <|
  "0,1" -> 2.404825,
  "1,1" -> 3.831706,
  "2,1" -> 5.135622,
  "0,2" -> 5.520078,
  "1,2" -> 7.015587,
  "0,3" -> 8.653728
|>;

(* --- Membrane head spec ------------------------------------------- *)
mylarThicknessMMEstimate = 0.254;       (* 10 mil mylar *)
mylarDensityEstimate = 1390.0;          (* kg/m^3 *)
sigmaHeadEstimate = mylarDensityEstimate (mylarThicknessMMEstimate / 1000.0);  (* kg/m^2 *)

(* --- Drums --------------------------------------------------------- *)
drumsEstimate = {
  <|"id" -> "drum-1", "od_mm" -> 300, "height_mm" -> 180, "targetNote" -> "A2", "targetMidi" -> 45|>,
  <|"id" -> "drum-2", "od_mm" -> 250, "height_mm" -> 160, "targetNote" -> "C3", "targetMidi" -> 48|>,
  <|"id" -> "drum-3", "od_mm" -> 200, "height_mm" -> 140, "targetNote" -> "E3", "targetMidi" -> 52|>,
  <|"id" -> "drum-4", "od_mm" -> 150, "height_mm" -> 120, "targetNote" -> "G3", "targetMidi" -> 55|>,
  <|"id" -> "drum-5", "od_mm" -> 100, "height_mm" -> 100, "targetNote" -> "A3", "targetMidi" -> 57|>
};

(* --- Per-drum acoustic prediction --------------------------------- *)
predictDrum[d_] := Module[
  {aM, fTarget, tensionReq, f01, f11, f21, fShellRing, shellODmm = d["od_mm"]},
  aM = (shellODmm/1000.0) / 2.0;
  fTarget = freqMidi[d["targetMidi"]];

  (* Tension required so that f01 = fTarget *)
  tensionReq = sigmaHeadEstimate ((2 Pi aM fTarget) / zBessel["0,1"])^2;

  (* Predicted partials (ideal membrane, no shell load, no air load) *)
  f01 = (zBessel["0,1"] / (2 Pi aM)) Sqrt[tensionReq / sigmaHeadEstimate];
  f11 = (zBessel["1,1"] / (2 Pi aM)) Sqrt[tensionReq / sigmaHeadEstimate];
  f21 = (zBessel["2,1"] / (2 Pi aM)) Sqrt[tensionReq / sigmaHeadEstimate];

  (* Shell ring mode (Love's thin-cylinder formula, n=2 ovalling).
     f_ring ~ (1/(2 pi a)) * Sqrt(E/(rho (1-nu^2))) * (h/a) * n(n^2-1)/Sqrt(n^2+1)
     for n=2 on a steel shell. *)
  fShellRing = Module[{Esteel = 200.0*10^9, rhoSteel = 7850.0, nuSteel = 0.30,
                       h = 1.2/1000.0, aShell = (shellODmm/1000.0)/2.0, n = 2},
    (1.0/(2 Pi aShell)) Sqrt[Esteel/(rhoSteel (1 - nuSteel^2))] (h/aShell) (n (n^2 - 1)/Sqrt[n^2 + 1])
  ];

  <|
    "id" -> d["id"],
    "targetNote" -> d["targetNote"],
    "targetHz" -> N[fTarget, 5],
    "tension_N_per_m" -> N[tensionReq, 5],
    "predicted_f01_Hz" -> N[f01, 5],
    "predicted_f11_Hz" -> N[f11, 5],
    "predicted_f21_Hz" -> N[f21, 5],
    "shell_ring_n2_Hz" -> N[fShellRing, 5],
    "shell_decoupled" -> (fShellRing > 4 fTarget)
  |>
];

predictionsEstimate = Dataset[predictDrum /@ drumsEstimate];

(* --- Aggregate sanity ----------------------------------------------- *)
totalSpan = <|
  "low_Hz" -> First[freqMidi /@ drumsEstimate[[All, "targetMidi"]]],
  "high_Hz" -> Last[freqMidi /@ drumsEstimate[[All, "targetMidi"]]],
  "semitones_span" -> Last[drumsEstimate[[All, "targetMidi"]]] - First[drumsEstimate[[All, "targetMidi"]]]
|>;

(* --- Sensitivity to head thickness ---------------------------------- *)
(* If we swap to 7 mil mylar (lighter), tensions scale by 7/10 to hit
   the same pitch. Worth predicting for the smallest drum, which is
   already close to a loose-tuning floor. *)
sensitivity7MilEstimate = Module[{thin = 0.178/1000.0, sigmaThin, ts},
  sigmaThin = mylarDensityEstimate thin;
  ts = sigmaThin ((2 Pi ((drumsEstimate[[5]]["od_mm"]/1000.0)/2.0) freqMidi[drumsEstimate[[5]]["targetMidi"]])/zBessel["0,1"])^2;
  <|"drum-5 with 7mil head tension_N_per_m" -> N[ts, 4]|>
];

(* --- Outputs ------------------------------------------------------- *)
Print["Per-drum predictionsEstimate:"];
predictionsEstimate

Print["Total span:"];
totalSpan

Print["Sensitivity to thinner head:"];
sensitivity7MilEstimate

(*
Measured tuning template — fill validation.csv with measured_hz once heads are on:
  measurements = {
    <|"id" -> "drum-1", "partial" -> "f01", "targetHz" -> 110.00, "measuredHz" -> ___|>,
    ...
  };
  Dataset[Append[#, "cents_err" -> centsErr[#measuredHz, #targetHz]] & /@ measurements]
*)
