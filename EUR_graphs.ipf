#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3		// Use modern global access method and strict wave access.


//////////////////////////
///// 05/16/19 Update ///
/////////////////////////

Window Gizmo_RHS_vs_A_j() : GizmoPlot
	// alternatively run with rhs_iEqualminF_vs_j_vs_thetaA
	// make sure to update labels according to rhs_iEqualF_vs_j_vs_thetaA assignment in RHS_vs_thetas
	PauseUpdate; Silent 1		// building window...
	// Building Gizmo 7 window...
	NewGizmo/W=(35,282,550,742)
	ModifyGizmo startRecMacro=700
	ModifyGizmo scalingMode=8
	ModifyGizmo setOuterBox={0,399,0,1,0,9}
	ModifyGizmo scalingOption=15
	AppendToGizmo Surface=root:rhs_iEqualF_vs_j_vs_thetaA,name=surface0
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ srcMode,0}
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ surfaceCTab,Rainbow}
	AppendToGizmo Axes=boxAxes,name=axes0
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisScalingMode,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelText,"\\Z15\rRecord index"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelText,"\\Z15\\[0\rθ\\Ba\\M/π\r\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelText,"\\Z15\\[0\nRHS\\B(i=f=-1)\\M\n\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,labelBillboarding,1}
	ModifyGizmo modifyObject=axes0,objectType=Axes,property={-1,Clipped,0}
	ModifyGizmo setDisplayList=0, object=surface0
	ModifyGizmo setDisplayList=1, object=axes0
	ModifyGizmo currentGroupObject=""
	ShowTools
	ModifyGizmo endRecMacro
	ModifyGizmo SETQUATERNION={0.566832,-0.128417,-0.190112,0.791245}
	Execute/Q/Z "SetWindow kwTopWin sizeLimit={46,234,inf,inf}" // sizeLimit requires Igor 7 or later

	Display /W=(247,359,785,730)
	AppendImage/T rhs_iEqualF_vs_j_vs_thetaA
	ModifyImage rhs_iEqualF_vs_j_vs_thetaA ctab= {6,9,RedWhiteBlue256,0}
	ModifyGraph margin(left)=49,margin(bottom)=14,margin(top)=45,margin(right)=14
	ModifyGraph mirror=2
	ModifyGraph minor=1
	ModifyGraph fSize=15
	ModifyGraph standoff=0
	ModifyGraph tkLblRot(left)=90
	ModifyGraph btLen=3
	ModifyGraph tlOffset=-2
	Label left "\\Z20\\[0θ\\Ba\\M/π\\]0"
	Label top "\\Z20Record index"
	Cursor/P/I A rhs_iEqualF_vs_j_vs_thetaA 177,14
	ShowInfo
	TextBox/C/N=t0/X=0.84/Y=0.96 "\\Z20\\[0θ\\Bf\\M=π/2\\]0 "
	ColorScale/C/N=text0/H={0,2,10}/A=MC/X=39.58/Y=-10.58
	ColorScale/C/N=text0 image=rhs_iEqualF_vs_j_vs_thetaA
	AppendText "\\Z20RHS\\B(i=f=-1)\\M"
EndMacro

Window Graph_min_RHS_update() : Graph
	// based on doit() version 05/16/19 [oops, this is bad practice :(]
	PauseUpdate; Silent 1		// building window...
	Display /W=(609,208,1004,416) tmp_min_rhs,tmp,fit_tmp_min_rhs,foo
	ModifyGraph mode(tmp_min_rhs)=3
	ModifyGraph marker(tmp_min_rhs)=42
	ModifyGraph lStyle(tmp)=3,lStyle(foo)=4
	ModifyGraph rgb(tmp)=(0,0,0),rgb(fit_tmp_min_rhs)=(0,0,65535),rgb(foo)=(0,0,0)
	ModifyGraph msize(tmp_min_rhs)=5
	ModifyGraph axOffset(bottom)=0.0833333
	Label left "\\Z20\\[0min\\Bj\\M {RHS\\Bi=f=-1\\M}\\]0"
	Label bottom "\\Z20\\[0θ\\Ba\\M/π\\]0"
	SetAxis left*,0.6
	Cursor/P A tmp_min_rhs 14
	ShowInfo
	Legend/C/N=text0/J/H={0,2,10}/A=MC/X=4.88/Y=38.81 "\\Z12\\[0\r\\s(tmp_min_rhs) min\\Bj\\M {RHS\\Bi=f=-1\\M}  \\s(fit_tmp_min_rhs) Sine fit"
	AppendText "Analytic: \\s(tmp) i=f ; \\s(foo) i=-f\r\\]0"
EndMacro



//////////////////////////
///// 04/24/19 Update ///
/////////////////////////
Window Gizmo_record_vs_weakValue() : GizmoPlot
	PauseUpdate; Silent 1		// building window...
	// Building Gizmo 7 window...
	NewGizmo/W=(-10,120,505,580)
	ModifyGizmo startRecMacro=700
	ModifyGizmo scalingOption=63
	AppendToGizmo Surface=root:Weak_vs_theta,name=surface0
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ srcMode,0}
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ surfaceCTab,Blue}
	AppendToGizmo Axes=boxAxes,name=axes0
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,lineWidth,8}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,lineWidth,8}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisScalingMode,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisColor,1,0.250019,0.250019,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={3,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={4,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisColor,0.250019,0.433326,1,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={6,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={7,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={8,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={9,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={10,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={11,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelText,"\\Z20\\[0\nθ\\Ba\\M/π\n\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelText,"\\Z20\\[0\nθ\\Bf\\M/π\n\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelText,"\\Z20\\[0\rRecord\r\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabelText,"\\Z20\\[0\nWeak Value\r\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,labelBillboarding,1}
	ModifyGizmo modifyObject=axes0,objectType=Axes,property={-1,Clipped,0}
	AppendToGizmo Surface=root:min_j_loc,name=surface1
	ModifyGizmo ModifyObject=surface1,objectType=surface,property={ srcMode,0}
	ModifyGizmo ModifyObject=surface1,objectType=surface,property={ surfaceCTab,Red}
	ModifyGizmo setDisplayList=0, object=surface0
	ModifyGizmo setDisplayList=1, object=axes0
	ModifyGizmo setDisplayList=2, object=surface1
	ModifyGizmo autoscaling=1
	ModifyGizmo currentGroupObject=""
	ModifyGizmo endRecMacro
	ModifyGizmo SETQUATERNION={0.611236,0.017305,-0.029818,0.790697}

	Display /W=(506,352,905,562) min_j_loc[5][*],Weak_vs_theta[5][*]
	ModifyGraph rgb(Weak_vs_theta)=(16385,28398,65535)
	ModifyGraph fSize=12
	Label left "\\Z15\\K(60000,15000,15000)Record\r\\K(15000,15000,60000)Weak value"
	Label bottom "\\Z20\\[0θ\\Bf\\M/π\\[0"
	SetAxis left -25,25
	TextBox/C/N=t0/X=-2.44/Y=78.26 "\\Z15\\[0θ\\Ba\\M = 0.42 π\\]0"

	Display /W=(505,585,900,793) min_j_loc[11][*],Weak_vs_theta[11][*]
	ModifyGraph rgb(Weak_vs_theta)=(16385,28398,65535)
	Label left "\\Z15\\K(60000,15000,15000)Record\r\\K(15000,15000,60000)Weak value"
	Label bottom "\\Z20\\[0θ\\Bf\\M/π\\]0"
	SetAxis left -25,25
	TextBox/C/N=t0/X=-0.68/Y=80.52 "\\Z15\\[0θ\\Ba\\M = 1 π\\]0"

	Display /W=(509,121,904,329) min_j_loc[0][*],Weak_vs_theta[0][*]
	ModifyGraph rgb(Weak_vs_theta)=(16385,28398,65535)
	ModifyGraph fSize=12
	ModifyGraph lblMargin(left)=12
	Label left "\\Z15\\K(60000,15000,15000)Record\r\\K(15000,15000,60000)Weak value"
	Label bottom "\\Z20\\[0θ\\Bf\\M/π\\]0"
	SetAxis left -25,25
	Cursor/P A min_j_loc 1
	TextBox/C/N=t0/X=-0.35/Y=78.99 "\\Z15\\[0θ\\Ba\\M = 0 π\\]0"
EndMacro

Window Gizmo_term1_compare() : GizmoPlot
	PauseUpdate; Silent 1		// building window...
	// Building Gizmo 7 window...
	NewGizmo/W=(450,96,965,556)
	ModifyGizmo startRecMacro=700
	ModifyGizmo scalingOption=63
	AppendToGizmo Surface=root:f_agree_vs_theta,name=surface0
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ srcMode,0}
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ surfaceCTab,Rainbow}
	AppendToGizmo Axes=boxAxes,name=axes0
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisScalingMode,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelText,"\\Z20\\[0\rθ\\Ba\\M/π\r\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelText,"\\Z20\\[0\nθ\\Bf\\M /π\n\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelText,"\\Z20 \\[0\nRHS\\S(T1)\\M\\B+,-\n\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabelText,"\\Z20\\[0\nRHS\\S(T1)\\M\\B+,+\n\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,labelBillboarding,1}
	ModifyGizmo modifyObject=axes0,objectType=Axes,property={-1,Clipped,0}
	AppendToGizmo Surface=root:f_disagree_vs_theta,name=surface1
	ModifyGizmo ModifyObject=surface1,objectType=surface,property={ srcMode,0}
	ModifyGizmo ModifyObject=surface1,objectType=surface,property={ surfaceCTab,Rainbow256}
	ModifyGizmo setDisplayList=0, object=surface0
	ModifyGizmo setDisplayList=1, object=axes0
	ModifyGizmo setDisplayList=2, object=surface1
	ModifyGizmo autoscaling=1
	ModifyGizmo currentGroupObject=""
	ModifyGizmo endRecMacro
	ModifyGizmo SETQUATERNION={0.681043,-0.050112,-0.118256,0.720866}

	NewGizmo/W=(966,101,1481,561)
	ModifyGizmo startRecMacro=700
	ModifyGizmo scalingOption=63
	AppendToGizmo Surface=root:f_agree_vs_theta_hiRes,name=surface0
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ srcMode,0}
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ surfaceCTab,Rainbow}
	AppendToGizmo Axes=boxAxes,name=axes0
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisScalingMode,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelText,"\\Z20\\[0\nθ\\Ba\\M/π\n\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelText,"\\Z20\\[0\nθ\\Bf\\M/π\n\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelText,"\\Z20\\[0\rRHS\\S(T1)\\M\\B+-\\M\r\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabelText,"\\Z20\\[0\nRHS\\S(T1)\\M\\B++\\M\n\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,labelBillboarding,1}
	ModifyGizmo modifyObject=axes0,objectType=Axes,property={-1,Clipped,0}
	AppendToGizmo Surface=root:f_disagree_vs_theta_hiRes,name=surface1
	ModifyGizmo ModifyObject=surface1,objectType=surface,property={ srcMode,0}
	ModifyGizmo ModifyObject=surface1,objectType=surface,property={ surfaceCTab,Rainbow}
	ModifyGizmo setDisplayList=0, object=surface0
	ModifyGizmo setDisplayList=1, object=axes0
	ModifyGizmo setDisplayList=2, object=surface1
	ModifyGizmo autoscaling=1
	ModifyGizmo currentGroupObject=""
	ModifyGizmo endRecMacro
	ModifyGizmo SETQUATERNION={0.658568,-0.077867,-0.094594,0.742481}

	NewGizmo/W=(942,318,1457,778)
	ModifyGizmo startRecMacro=700
	ModifyGizmo scalingOption=63
	AppendToGizmo Surface=root:f_agree_mm_vs_theta,name=surface0
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ srcMode,0}
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ surfaceCTab,Red}
	AppendToGizmo Axes=boxAxes,name=axes0
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,lineWidth,8}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,lineWidth,8}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisScalingMode,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisColor,0.250019,0.433326,1,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={3,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={4,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisColor,0.8,1.5259e-05,1.5259e-05,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={6,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={7,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={8,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={9,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={10,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={11,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelText,"\\Z20\\[0\nθ\\Ba\\M/π\n\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelText,"\\Z20\\[0\nθ\\Bf\\M/π\n\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelText,"\\Z20\\[0\rRHS\\S(T1)\\M\\B++\\M\r\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabelText,"\\Z20\\[0\nRHS\\S(T1)\\M\\B--\\M\n\\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,labelBillboarding,1}
	ModifyGizmo modifyObject=axes0,objectType=Axes,property={-1,Clipped,0}
	AppendToGizmo Surface=root:f_agree_vs_theta,name=surface1
	ModifyGizmo ModifyObject=surface1,objectType=surface,property={ srcMode,0}
	ModifyGizmo ModifyObject=surface1,objectType=surface,property={ surfaceCTab,Blue}
	ModifyGizmo setDisplayList=0, object=surface0
	ModifyGizmo setDisplayList=1, object=axes0
	ModifyGizmo setDisplayList=2, object=surface1
	ModifyGizmo autoscaling=1
	ModifyGizmo currentGroupObject=""
	ModifyGizmo endRecMacro
	ModifyGizmo SETQUATERNION={-0.682978,0.116413,0.153502,-0.704571}
EndMacro


//////////////////////////
///// 05/22/19 Update ///
/////////////////////////
Window graph_rhs_min_fixed_if() : Graph
	PauseUpdate; Silent 1		// building window...
	Display /W=(536,265,1019,466) rhs_mm_min_vs_thetaA,rhs_pp_min_vs_thetaA,rhs_pm_min_vs_thetaA
	AppendToGraph rhs_mp_min_vs_thetaA,RHS_value_vs_theta[*][1]
	ModifyGraph marker=42
	ModifyGraph lSize(RHS_value_vs_theta)=3
	ModifyGraph lStyle(RHS_value_vs_theta)=3
	ModifyGraph rgb(rhs_mm_min_vs_thetaA)=(16385,28398,65535),rgb(rhs_pp_min_vs_thetaA)=(0,65535,65535)
	ModifyGraph rgb(rhs_pm_min_vs_thetaA)=(39321,1,1),rgb(RHS_value_vs_theta)=(0,0,0)
	ModifyGraph msize=4
	ModifyGraph axOffset(bottom)=0.0833333
	Label left "\\Z20\\[0min\\Bj\\M {RHS\\Bi,f\\M}\\]0"
	Label bottom "\\Z20\\[0θ\\Ba\\M/π\\]0"
	Cursor/P A RHS_value_vs_theta 3
	ShowInfo
	Legend/C/N=text0/J/H={0,2,10}/A=MC/X=42.42/Y=-9.92 "\\Z15\r\ti,f\r\\s(rhs_mm_min_vs_thetaA) - -\r\\s(rhs_pp_min_vs_thetaA) + +\r\\s(rhs_pm_min_vs_thetaA) + -"
	AppendText "\\s(rhs_mp_min_vs_thetaA) - +\r\\s(RHS_value_vs_theta) RHS"
	TextBox/C/N=t1/X=81.75/Y=74.81 "\\Z20\\[0θ\\Bf\\M=π/2\\]0 "
EndMacro


Window graph_lhsRHS_binSizeScaling() : Graph
	PauseUpdate; Silent 1		// building window...
	Display /W=(674,532,1142,773) rhs_vs_bin vs bin_sizes
	AppendToGraph lhs_vs_bin vs bin_sizes
	ModifyGraph mode=3
	ModifyGraph marker=42
	ModifyGraph rgb(rhs_vs_bin)=(16385,28398,65535)
	ModifyGraph msize=5
	ModifyGraph fSize=12
	ModifyGraph lblMargin(left)=7
	ModifyGraph log(bottom)=1
	Label left "\\Z20 \\K(16385,28398,65535)RHS\\K(0,0,0) ||  \\K(60000,10000,10000)LHS"
	Label bottom "\\Z20 Bin size"
EndMacro

Window graph_fitSerpentineRidge() : Graph
	PauseUpdate; Silent 1		// building window...
	Display /W=(206,309,601,517) RHS_value_vs_theta[*][7],fit_RHS_value_vs_theta
	ModifyGraph mode(RHS_value_vs_theta)=3
	ModifyGraph rgb(RHS_value_vs_theta)=(0,0,0)
	ModifyGraph msize(RHS_value_vs_theta)=5
	Label left "\\Z20 RHS"
	Label bottom "\\Z20\\[0θ\\Ba\\M/π\\]0"
	SetAxis left*,6.8
	ShowInfo
	TextBox/C/N=t0/X=-3.72/Y=68.15 "\\Z15\\[0θ\\Bf\\M =0.57 π\\]0"
	TextBox/C/N=text0/B=1/X=48.31/Y=-7.41 "\\Z15\\[0\rSine fit: A sin(2πf θ\\Ba\\M/π)\rf = 0.99\rA = 0.18\r\\]0"
EndMacro


//////////////////////////
///// 05/xx/19 Update ///
/////////////////////////

Window graph_infidelity() : Graph
	PauseUpdate; Silent 1		// building window...
	Display /W=(518,452,913,660) infidelity_vs_snr
	ModifyGraph mode=3
	ModifyGraph marker=42
	ModifyGraph msize=4
	ModifyGraph log(left)=1
	ModifyGraph fSize=12
	Label left "\\Z20Infidelity"
	Label bottom "\\Z20Strong SNR"
	Cursor/P A infidelity_vs_snr 8
	ShowInfo
EndMacro


Window Gizmo_RHS_LHS() : GizmoPlot
	PauseUpdate; Silent 1		// building window...
	// Building Gizmo 7 window...
	NewGizmo/W=(1123,474,1638,934)
	ModifyGizmo startRecMacro=700
	ModifyGizmo scalingMode=8
	ModifyGizmo setOuterBox={0,2,0.1,0.9,5,7}
	ModifyGizmo scalingOption=15
	AppendToGizmo Surface=root:RHS_value_vs_theta,name=surface0
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ srcMode,0}
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ surfaceCTab,Rainbow}
	AppendToGizmo Axes=boxAxes,name=axes0
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisScalingMode,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={3,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={3,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelText,"\\Z20\\[0\nθ\\Ba\\M/π\n\\[0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelText,"\\Z20\\[0\nθ\\Bf\\M/π\n\\[0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={3,axisLabelText,"\\Z20\\[0\nRHS\n\\[0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={3,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={3,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={3,labelBillboarding,1}
	ModifyGizmo modifyObject=axes0,objectType=Axes,property={-1,Clipped,0}
	ModifyGizmo setDisplayList=0, object=surface0
	ModifyGizmo setDisplayList=1, object=axes0
	ModifyGizmo currentGroupObject=""
	ShowTools
	ModifyGizmo endRecMacro
	ModifyGizmo syncRotation=Gizmo0
	Execute/Q/Z "SetWindow kwTopWin sizeLimit={46,234,inf,inf}" // sizeLimit requires Igor 7 or later

	NewGizmo/W=(676,360,1191,820)
	ModifyGizmo startRecMacro=700
	ModifyGizmo scalingOption=63
	AppendToGizmo Surface=root:LHS_min_vs_thetas,name=surface0
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ srcMode,0}
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ surfaceCTab,Rainbow}
	AppendToGizmo Axes=boxAxes,name=axes0
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisScalingMode,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelText,"\\Z20\\[0\rθ\\Ba\\M/π\r\\[0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelText,"\\Z20\\[0\nθ\\Bf\\M/π\n\\[0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelText,"\\Z20LHS"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelDistance,0}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelRGBA,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,labelBillboarding,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,labelBillboarding,1}
	ModifyGizmo modifyObject=axes0,objectType=Axes,property={-1,Clipped,0}
	ModifyGizmo setDisplayList=0, object=surface0
	ModifyGizmo setDisplayList=1, object=axes0
	ModifyGizmo autoscaling=1
	ModifyGizmo currentGroupObject=""
	ModifyGizmo showInfo
	ModifyGizmo infoWindow={5,23,822,320}
	ModifyGizmo endRecMacro
	ModifyGizmo idleEventQuaternion={3.57739e-05,2.85224e-05,9.77739e-06,1}
EndMacro
