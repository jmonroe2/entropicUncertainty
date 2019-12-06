(* ::Package:: *)

(* ::Chapter:: *)
(*RHS Calculation*)


l=0.25;
params = {\[Delta]t-> 0.1, \[Tau]-> 1,\[Phi]f->0,\[Phi]a->0,r0->1};
\[DoubleStruckCapitalF][\[Theta]f_]=({
 {Cos[\[Theta]f], Sin[\[Theta]f]*Cos[\[Phi]f]-I*Sin[\[Theta]f]*Sin[\[Phi]f]},
 {Sin[\[Theta]f]*Cos[\[Phi]f]+I*Sin[\[Theta]f]*Sin[\[Phi]f], -Cos[\[Theta]f]}
});
\[DoubleStruckCapitalZ]=({
 {1, 0},
 {0, -1}
});
\[DoubleStruckCapitalX][ii_,f_,\[Theta]a_,\[Theta]f_]:=1/2 (({
 {1, 0},
 {0, 1}
})+f*\[DoubleStruckCapitalF][\[Theta]f])
\[DoubleStruckCapitalW][ii_,f_,\[Theta]a_,\[Theta]f_]:=1/2 (({
 {1, 0},
 {0, 1}
})+ii*\[DoubleStruckCapitalZ])
A$wkreal[ii_,f_,\[Theta]a_,\[Theta]f_]:=((Cos[\[Theta]a] (ii+f* Cos[\[Theta]f])+f* Sin[\[Theta]a]* Sin[\[Theta]f] *Cos[\[Phi]a-\[Phi]f])/(1+ii *f*Cos[\[Theta]f]))/.params

r[ii_,f_,\[Theta]a_,\[Theta]f_]:=A$wkreal[ii,f,\[Theta]a,\[Theta]f]/Log[2]/.params
P$r[ii_,f_,\[Theta]a_,\[Theta]f_]:=l/r0*(\[Delta]t/(2\[Pi]*\[Tau]))^(1/2)*Exp[-\[Delta]t/(2*\[Tau]) ((r[ii,f,\[Theta]a,\[Theta]f]/r0)^2+1)]/.params
g$r[ii_,f_,\[Theta]a_,\[Theta]f_]:=(r[ii,f,\[Theta]a,\[Theta]f]*Sqrt[l])/(r0^(3/2)*\[Pi]^(1/4)) (\[Delta]t/(2*\[Tau]))^(5/4)*Exp[-\[Delta]t/(4*\[Tau]) ((r[ii,f,\[Theta]a,\[Theta]f]/r0)^2+1)]/.params

LogHelp[r_]:=If[(x[r]/.params)===Indeterminate,0,x[r]]/.params;
f$wk[ii_,f_,\[Theta]a_,\[Theta]f_]:=-Log[2,P$r[ii,f,\[Theta]a,\[Theta]f]*Tr[\[DoubleStruckCapitalX][ii,f,\[Theta]a,\[Theta]f].\[DoubleStruckCapitalW][ii,f,\[Theta]a,\[Theta]f]]]-(2*Tr[\[DoubleStruckCapitalW][ii,f,\[Theta]a,\[Theta]f]])/(Log[2]*Sqrt[P$r[ii,f,\[Theta]a,\[Theta]f]])*(g$r[ii,f,\[Theta]a,\[Theta]f]*A$wkreal[ii,f,\[Theta]a,\[Theta]f])/.params
RHS$T1[ii_,f_,\[Theta]a_,\[Theta]f_]:=-Log[2,P$r[ii,f,\[Theta]a,\[Theta]f]*Tr[\[DoubleStruckCapitalX][ii,f,\[Theta]a,\[Theta]f].\[DoubleStruckCapitalW][ii,f,\[Theta]a,\[Theta]f]]]/.params;
h[\[Theta]a_,\[Theta]f_]:=Min[f$wk[1,1,\[Theta]a,\[Theta]f],f$wk[-1,1,\[Theta]a,\[Theta]f],f$wk[1,-1,\[Theta]a,\[Theta]f],f$wk[-1,-1,\[Theta]a,\[Theta]f]]
RHS$T2[ii_,f_,\[Theta]a_,\[Theta]f_]:=-((2*Tr[\[DoubleStruckCapitalW][ii,f,\[Theta]a,\[Theta]f]])/(Log[2]*Sqrt[l*P$r[ii,f,\[Theta]a,\[Theta]f]]))*(g$r[ii,f,\[Theta]a,\[Theta]f]*A$wkreal[ii,f,\[Theta]a,\[Theta]f])/.params
(*ArgMax[{h[\[Theta]a,\[Theta]f],0<\[Theta]a\[LessEqual]\[Pi],0<\[Theta]f\[LessEqual]\[Pi]}, {\[Theta]a,\[Theta]f}]
MaxValue[{h[\[Theta]a,\[Theta]f],0<\[Theta]a\[LessEqual]\[Pi],0<\[Theta]f\[LessEqual]\[Pi]}, {\[Theta]a,\[Theta]f}]*)




For[i=1,i<=20,i++,l=1/i;
Print[h[0.4 Pi,0.5 Pi]]
]

