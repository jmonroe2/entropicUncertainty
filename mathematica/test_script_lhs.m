rmax = 12/l; (*SHOULD THIS DEPEND ON BIN SIZE?*)

params2 = {\[Delta]t -> 0.1, \[Tau] -> 1, r0 -> 1};
l = 1;

\[DoubleStruckCapitalZ] = ( {
   {1, 0},
   {0, -1}
  } ); (*sigma z*)
\[Rho] [\[Theta]\[Rho]_, \[Phi]\[Rho]_] := ( {
   {(Cos[\[Theta]\[Rho]/2])^2, 
    Cos[\[Theta]\[Rho]/2]*Sin[\[Theta]\[Rho]/2]*
     Exp[-I*\[Phi]\[Rho]]},
   {Cos[\[Theta]\[Rho]/2]*Sin[\[Theta]\[Rho]/2]*
     Exp[I*\[Phi]\[Rho]], (Sin[\[Theta]\[Rho]/2])^2}
  } ); (*Density matrix*)
\[DoubleStruckCapitalO] = 1/2 (( {
      {1, 0},
      {0, 1}
     } ) + 
    1*\[DoubleStruckCapitalZ]); (*Pi_i=Z with eigenvalue 1*)
\
\[DoubleStruckCapitalP] = 1/2 (( {
      {1, 0},
      {0, 1}
     } ) - 
    1*\[DoubleStruckCapitalZ]);(*Pi_i=Z with eigenvalue -1*)
\
\[DoubleStruckCapitalA][\[Theta]a_, \[Phi]a_] := ( {
   {Cos[\[Theta]a], 
    Sin[\[Theta]a]*Cos[\[Phi]a] - I*Sin[\[Theta]a]*Sin[\[Phi]a]},
   {Sin[\[Theta]a]*Cos[\[Phi]a] + 
     I*Sin[\[Theta]a]*Sin[\[Phi]a], -Cos[\[Theta]a]}
  } );
\[DoubleStruckCapitalF][\[Theta]f_, \[Phi]f_] := ( {
    {Cos[\[Theta]f], 
     Sin[\[Theta]f]*Cos[\[Phi]f] - I*Sin[\[Theta]f]*Sin[\[Phi]f]},
    {Sin[\[Theta]f]*Cos[\[Phi]f] + 
      I*Sin[\[Theta]f]*Sin[\[Phi]f], -Cos[\[Theta]f]}
   } );
\[DoubleStruckCapitalM]$ra[r_, \[Theta]a_, \[Phi]a_] := 
  Sqrt[l]/Sqrt[1]*(\[Delta]t/(2 \[Pi]*\[Tau]))^(1/4)*
    MatrixExp[-\[Delta]t/(4*\[Tau]) (MatrixPower[r/1 ( {
            {1, 0},
            {0, 1}
           } ) - \[DoubleStruckCapitalA][\[Theta]a, \[Phi]a], 2])] /. 
   params2;
\[DoubleStruckCapitalM]$ra$dag[r_, \[Theta]a_, \[Phi]a_] := 
  Sqrt[l]/Sqrt[1]*(\[Delta]t/(2 \[Pi]*\[Tau]))^(1/4)*
    MatrixExp[-\[Delta]t/(4*\[Tau]) (MatrixPower[-r/1 ( {
            {1, 0},
            {0, 1}
           } ) - \[DoubleStruckCapitalA][\[Theta]a, \[Phi]a], 2])] /. 
   params2;
\[DoubleStruckCapitalM][\[Theta]f_, \[Phi]f_] := 1/2 (( {
      {1, 0},
      {0, 1}
     } ) + \[DoubleStruckCapitalF][\[Theta]f, \[Phi]f]); (*Pi_F with \
eigenvalue 1*)
\[DoubleStruckCapitalN][\[Theta]f_, \[Phi]f_] := 
 1/2 (( {
      {1, 0},
      {0, 1}
     } ) - \[DoubleStruckCapitalF][\[Theta]f, \[Phi]f]);(*Pi_F with \
eigenvalue -1*)

x[r_, \[Theta]\[Rho]_, \[Phi]\[Rho]_, \[Theta]a_, \[Theta]f_, \
\[Phi]f_, \[Phi]a_] := 
 Log[2, Tr[\[DoubleStruckCapitalN][\[Theta]f, \[Phi]f].\
\[DoubleStruckCapitalM]$ra[
      r, \[Theta]a, \[Phi]a].\[Rho][\[Theta]\[Rho], \[Phi]\[Rho]].\
\[DoubleStruckCapitalM]$ra$dag[r, \[Theta]a, \[Phi]a]]] /. params2;
y[r_, \[Theta]\[Rho]_, \[Phi]\[Rho]_, \[Theta]a_, \[Theta]f_, \
\[Phi]f_, \[Phi]a_] := 
  Log[2, Tr[\[DoubleStruckCapitalM][\[Theta]f, \[Phi]f].\
\[DoubleStruckCapitalM]$ra[
       r, \[Theta]a, \[Phi]a].\[Rho][\[Theta]\[Rho], \[Phi]\[Rho]].\
\[DoubleStruckCapitalM]$ra$dag[r, \[Theta]a, \[Phi]a]]] /. params2;
(* Help with logs *)

LogHelpx[r_, \[Theta]\[Rho]_, \[Phi]\[Rho]_, \[Theta]a_, \[Theta]f_, \
\[Phi]f_, \[Phi]a_] := 
 If[(x[r, \[Theta]\[Rho], \[Phi]\[Rho], \[Theta]a, \[Theta]f, \
\[Phi]f, \[Phi]a]) === Indeterminate,
  0, (*True*)
  
  x[r, \[Theta]\[Rho], \[Phi]\[Rho], \[Theta]a, \[Theta]f, \[Phi]f, \
\[Phi]a]]; (*False*)

LogHelpy[r_, \[Theta]\[Rho]_, \[Phi]\[Rho]_, \[Theta]a_, \[Theta]f_, \
\[Phi]f_, \[Phi]a_] := 
 If[(y[r, \[Theta]\[Rho], \[Phi]\[Rho], \[Theta]a, \[Theta]f, \
\[Phi]f, \[Phi]a]) === Indeterminate,
  0,
  y[r, \[Theta]\[Rho], \[Phi]\[Rho], \[Theta]a, \[Theta]f, \[Phi]f, \
\[Phi]a]];
LogHelp1[\[Theta]\[Rho]_, \[Phi]\[Rho]_] := 
  If[(Log[2, 
        Tr[\[DoubleStruckCapitalO].\[Rho][\[Theta]\[Rho], \
\[Phi]\[Rho]]]] /. params2) === -\[Infinity],
    0,
    Log[2, 
     Tr[\[DoubleStruckCapitalO].\[Rho][\[Theta]\[Rho], \
\[Phi]\[Rho]]]]] /. params2;
LogHelp2[\[Theta]\[Rho]_, \[Phi]\[Rho]_] := 
  If[(Log[2, 
        Tr[\[DoubleStruckCapitalP].\[Rho][\[Theta]\[Rho], \
\[Phi]\[Rho]]]] /. params2) === -\[Infinity],
    0,
    Log[2, 
     Tr[\[DoubleStruckCapitalP].\[Rho][\[Theta]\[Rho], \
\[Phi]\[Rho]]]]] /. params2;
(* Entropies *)
\[DoubleStruckCapitalH]$vnI[\[Theta]\[Rho]_, \[Phi]\
\[Rho]_] := -Tr[\[DoubleStruckCapitalO].\[Rho][\[Theta]\[Rho], \[Phi]\
\[Rho]]]*(LogHelp1[\[Theta]\[Rho], \[Phi]\[Rho]]) - 
   Tr[\[DoubleStruckCapitalP].\[Rho][\[Theta]\[Rho], \
\[Phi]\[Rho]]]*(LogHelp2[\[Theta]\[Rho], \[Phi]\[Rho]]);   
\[DoubleStruckCapitalH]$vnAF$singleR[
   r_, \[Theta]\[Rho]_, \[Phi]\[Rho]_, \[Theta]a_, \[Theta]f_, \
\[Phi]f_, \[Phi]a_] := (
   -(Tr[\[DoubleStruckCapitalM][\[Theta]f, \[Phi]f].\
\[DoubleStruckCapitalM]$ra[
          r, \[Theta]a, \[Phi]a].\[Rho][\[Theta]\[Rho], \
\[Phi]\[Rho]].\[DoubleStruckCapitalM]$ra$dag[
          r, \[Theta]a, \[Phi]a]]*(LogHelpy[
         r, \[Theta]\[Rho], \[Phi]\[Rho], \[Theta]a, \[Theta]f, \
\[Phi]f, \[Phi]a]))
    - (Tr[\[DoubleStruckCapitalN][\[Theta]f, \[Phi]f].\
\[DoubleStruckCapitalM]$ra[
         r, \[Theta]a, \[Phi]a].\[Rho][\[Theta]\[Rho], \[Phi]\[Rho]].\
\[DoubleStruckCapitalM]$ra$dag[r, \[Theta]a, \[Phi]a]]*(LogHelpx[
        r, \[Theta]\[Rho], \[Phi]\[Rho], \[Theta]a, \[Theta]f, \
\[Phi]f, \[Phi]a]))
   );
\[DoubleStruckCapitalH]$vnAF[\[Theta]\[Rho]_, \[Phi]\[Rho]_, \
\[Theta]a_, \[Theta]f_, \[Phi]f_, \[Phi]a_] := 
  Sum[\[DoubleStruckCapitalH]$vnAF$singleR[
    r, \[Theta]\[Rho], \[Phi]\[Rho], \[Theta]a, \[Theta]f, \[Phi]f, \
\[Phi]a],
   {r, -rmax + (l/2), rmax - (l/2), l}];
LHS[\[Theta]\[Rho]_, \[Phi]\[Rho]_, \[Theta]a_, \[Theta]f_, \[Phi]f_, \
\[Phi]a_] := \[DoubleStruckCapitalH]$vnI[\[Theta]\[Rho], \
\[Phi]\[Rho]] + \[DoubleStruckCapitalH]$vnAF[\[Theta]\[Rho], \[Phi]\
\[Rho], \[Theta]a, \[Theta]f, \[Phi]f, \[Phi]a];

Print[LHS[0.1 Pi, 0, 0.4 Pi, 0.5 Pi, 0, 0]]
l = 0.1;
Print[LHS[0.1 Pi, 0, 0.4 Pi, 0.5 Pi, 0, 0]]

