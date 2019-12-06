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
	
		NewGizmo/W=(46,273,561,733)
	ModifyGizmo startRecMacro=700
	ModifyGizmo scalingOption=63
	AppendToGizmo Surface=root:lhs_rhs_diff,name=surface0
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ srcMode,0}
	ModifyGizmo ModifyObject=surface0,objectType=surface,property={ surfaceCTab,Rainbow}
	AppendToGizmo Axes=boxAxes,name=axes0
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisRange,-1,-1,-1,1,-1,-1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisRange,-1,-1,-1,-1,1,-1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisRange,-1,-1,-1,-1,-1,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={3,axisRange,-1,1,-1,-1,1,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={4,axisRange,1,1,-1,1,1,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={5,axisRange,1,-1,-1,1,-1,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={6,axisRange,-1,-1,1,-1,1,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={7,axisRange,1,-1,1,1,1,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={8,axisRange,1,-1,-1,1,1,-1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={9,axisRange,-1,1,-1,1,1,-1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={10,axisRange,-1,1,1,1,1,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={11,axisRange,-1,-1,1,1,-1,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisScalingMode,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={-1,axisColor,0,0,0,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,ticks,3}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabel,1}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelText,"\\Z20\\[0\r\rθ\\Ba\\M/π\n\\[0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelText,"\\Z20\\[0\nθ\\Ba\\M/π\n\\[0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelText,"\\Z20\rLHS-RHS\r"}
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
	ModifyGizmo endRecMacro
	ModifyGizmo SETQUATERNION={0.495088,-0.300891,-0.444653,0.683113}
EndMacro


Window graph_amplitude_vs_snr() : Graph
	PauseUpdate; Silent 1		// building window...
	Display /W=(447,175,842,383) rhs_vs_thetaA,fit_rhs_vs_thetaA
	ModifyGraph mode(rhs_vs_thetaA)=3
	ModifyGraph lStyle(fit_rhs_vs_thetaA)=3
	ModifyGraph rgb(rhs_vs_thetaA)=(4369,4369,4369)
	ModifyGraph msize(rhs_vs_thetaA)=5
	Label left "\\Z20 RHS"
	Label bottom "\\Z20\\[0\nθ\\Ba\\M/π\n\\[0"
	SetAxis left 6.2,7
	TextBox/C/N=t0/X=2.03/Y=-1.48 "\\Z20\\[0\nθ\\Bf\\M=π/2\n\\[0"
	Tag/C/N=text0/F=0/H=4/A=MB/X=0.00/Y=30.00/L=4/TL={len=0.5,fat=1,sharp=1,frame=3,lThick=2,lineRGB=(64383,0,0)} rhs_vs_thetaA, 0.239999999999999991
	AppendText "\\K(60000,5000,5000)\\Z18Amplitude\r"
	Tag/C/N=text1/F=0/H=4/B=1/A=LB/X=0.00/Y=-45.00/L=3 rhs_vs_thetaA, 1.40000000000000013, "\\Z18 Average"

	Display /W=(441,406,974,664)
	AppendImage/T rhs_vs_thetaA_vs_snr
	ModifyImage rhs_vs_thetaA_vs_snr ctab= {5,*,RedWhiteBlue256,0}
	ModifyGraph margin(left)=47,margin(bottom)=14,margin(top)=44,margin(right)=14
	ModifyGraph mirror=2
	ModifyGraph nticks(left)=4,nticks(top)=3
	ModifyGraph minor=1
	ModifyGraph fSize=15
	ModifyGraph standoff=0
	ModifyGraph tkLblRot(left)=90
	ModifyGraph btLen=3
	ModifyGraph tlOffset=-2
	Label left "\\Z20\\[0\nθ\\Ba\\M/π\n\\[0"
	Label top "\\Z20 Proj. SNR"
	SetAxis/A/R left
	ColorScale/C/N=text0/A=MC/X=35.17/Y=-30.50 image=rhs_vs_thetaA_vs_snr, vert=0
	ColorScale/C/N=text0 width=100
	AppendText "\\Z20 RHS [bits]"
	TextBox/C/N=t0/X=82.84/Y=0.50 "\\Z20\\[0\nθ\\Bf\\M = π/2\n\\[0"

	Display /W=(34,376,429,584) amp_vs_snr
	AppendToGraph/R base_vs_snr
	ModifyGraph mode=3
	ModifyGraph marker=19
	ModifyGraph rgb(amp_vs_snr)=(60000,5000,5000),rgb(base_vs_snr)=(0,0,0)
	ModifyGraph msize=5
	Label left "\\Z20\\K(60000,5000,5000) Amplitude"
	Label right "\\Z20\\K(0000,0000,0000) Average"
	ErrorBars amp_vs_snr Y,wave=(amp_vs_snr_err,amp_vs_snr_err)
	ErrorBars base_vs_snr Y,wave=(base_vs_snr_err,base_vs_snr_err)
	ShowInfo
EndMacro

Window graph_infidelity_vs_snr() : Graph
	PauseUpdate; Silent 1		// building window...
	Display /W=(586,184,1122,457) infidelity_vs_snr
	ModifyGraph mode=3
	ModifyGraph marker=42
	ModifyGraph msize=4
	ModifyGraph log(left)=1
	ModifyGraph fSize=12
	Label left "\\Z20Infidelity"
	Label bottom "\\Z20Strong SNR"
	Cursor/P A infidelity_vs_snr 5
	ShowInfo
EndMacro


Window graph_lhs_dephasing() : Graph
	PauseUpdate; Silent 1		// building window...
	Display /W=(368,164,763,372) lhs_vs_dephasing vs dephasing_choices
	AppendToGraph/R rhs_vs_dephasing vs dephasing_choices
	ModifyGraph mode=3
	ModifyGraph marker(lhs_vs_dephasing)=19
	ModifyGraph rgb(lhs_vs_dephasing)=(0,0,0)
	ModifyGraph msize=5
	ModifyGraph log(bottom)=1
	ModifyGraph lblMargin(bottom)=4,lblMargin(right)=8
	ModifyGraph lblLatPos(bottom)=1,lblLatPos(right)=-4
	Label left "\\Z20 LHS [bits]"
	Label bottom "\\Z20ɣ t"
	Label right "\\Z20\\K(65009,0,2070) RHS [bits]"
	SetAxis left 7.55,7.85
	SetAxis right 6.35,6.65
	Cursor/P A lhs_vs_dephasing 16
	ShowInfo
	Legend/C/N=text0/J/H=4/A=LB/X=-1.95/Y=0.00 "\\Z20\r\\s(lhs_vs_dephasing) LHS\r\\s(rhs_vs_dephasing) RHS"
	Tag/C/N=text1/F=0/H=4/A=MB/X=-24.49/Y=18.84/TL={lThick=3,lineRGB=(0,43690,65535)} lhs_vs_dephasing, 16, "\\Z18\\[0\r70 ns pulses w/ T\\B2\\M=260 ns\r\\]0"
EndMacro


Window graph_eur_gizmos() : GizmoPlot
	PauseUpdate; Silent 1		// building window...
	// Building Gizmo 7 window...
	NewGizmo/W=(984,461,1499,921)
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
	ShowTools
	ModifyGizmo endRecMacro
	ModifyGizmo SETQUATERNION={0.151148,-0.187660,-0.747865,0.618577}
	Execute/Q/Z "SetWindow kwTopWin sizeLimit={46,234,inf,inf}" // sizeLimit requires Igor 7 or later

	// Building Gizmo 7 window...
	NewGizmo/W=(1053,486,1568,946)
	ModifyGizmo startRecMacro=700
	ModifyGizmo scalingMode=8
	ModifyGizmo setOuterBox={0.1,1.9,0.1,0.9,5.6,6.62931}
	ModifyGizmo scalingOption=47
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
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelText,"\\Z20\\[0\r \nθ\\Ba\\M/π\n\\[0"}
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
	ModifyGizmo SETQUATERNION={0.314704,0.034737,-0.094842,0.943801}
	Execute/Q/Z "SetWindow kwTopWin sizeLimit={46,234,inf,inf}" // sizeLimit requires Igor 7 or later

	// Building Gizmo 7 window...
	NewGizmo/W=(1109,510,1624,970)
	ModifyGizmo startRecMacro=700
	ModifyGizmo scalingMode=8
	ModifyGizmo setOuterBox={0.1,1.9,0.1,0.9,0.8,2}
	ModifyGizmo scalingOption=15
	AppendToGizmo Surface=root:diff_hiRes,name=surface0
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
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelText,"\\Z20\\[0 θ\\Ba\\M/π \\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelText,"\\Z20\\[0 θ\\Bf\\M/π \\]0"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelText,"LHS-RHS"}
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
	ModifyGizmo SETQUATERNION={-0.641534,0.183364,-0.637185,0.385804}
	Execute/Q/Z "SetWindow kwTopWin sizeLimit={46,234,inf,inf}" // sizeLimit requires Igor 7 or later
EndMacro



Window graph_study_weakness() : Graph
	PauseUpdate; Silent 1		// building window...
	Display /W=(296,296,743,629)
	AppendImage/T LHS_thetaA_snr
	ModifyImage LHS_thetaA_snr ctab= {*,*,Geo,0}
	ModifyImage LHS_thetaA_snr log= 1
	ModifyGraph margin(left)=50,margin(bottom)=14,margin(top)=49,margin(right)=14
	ModifyGraph mirror=2
	ModifyGraph nticks(left)=2,nticks(top)=3
	ModifyGraph minor=1
	ModifyGraph fSize=15
	ModifyGraph standoff=0
	ModifyGraph tkLblRot(left)=90
	ModifyGraph btLen=3
	ModifyGraph tlOffset=-2
	Label left "\\Z20 SNR"
	Label top "\\Z20\\[0θ\\Ba\\M [π]\\]0"
	ColorScale/C/N=text0/A=MC/X=31.07/Y=33.70 image=LHS_thetaA_snr, vert=0
	ColorScale/C/N=text0 widthPct=33
	AppendText "\\Z20\\[0 LHS, θ\\Bf\\M=π/2"
EndMacro


Window fig2_jointLHS() : Graph
	PauseUpdate; Silent 1		// building window...
	Display /W=(35,45,430,253) LHS_proj_vs_thetaF,thy_lhs_proj
	AppendToGraph/R LHS_min_vs_thetas_hiRes[4][*],RHS_value_vs_theta_hiRes[4][*]
	ModifyGraph mode(LHS_proj_vs_thetaF)=3,mode(LHS_min_vs_thetas_hiRes)=3
	ModifyGraph marker(LHS_proj_vs_thetaF)=19,marker(LHS_min_vs_thetas_hiRes)=19
	ModifyGraph lSize(thy_lhs_proj)=2,lSize(RHS_value_vs_theta_hiRes)=2
	ModifyGraph lStyle(thy_lhs_proj)=3,lStyle(RHS_value_vs_theta_hiRes)=3
	ModifyGraph rgb(LHS_proj_vs_thetaF)=(0,0,0),rgb(thy_lhs_proj)=(0,0,0),rgb(LHS_min_vs_thetas_hiRes)=(16385,28398,65535)
	ModifyGraph rgb(RHS_value_vs_theta_hiRes)=(16385,28398,65535)
	ModifyGraph msize(LHS_proj_vs_thetaF)=5
	ModifyGraph lblMargin(left)=6,lblMargin(right)=10
	ModifyGraph lblLatPos(left)=-1
	Label left "\\Z20H(I) + H(F)"
	Label bottom "\\Z20\\[0θ\\Bf\\M/π"
	Label right "\\Z20\\K(15824,27433,63181)\rH(I) + H(AF)"
	ShowInfo
EndMacro

Window graph_averaging_of_weakvalue() : Graph
	PauseUpdate; Silent 1		// building window...
	Display /W=(417,50,812,258) r_post_pp
	ModifyGraph mode=2
	ModifyGraph lblMargin(left)=4
	Label left "\\Zr200 j"
	Label bottom "\\Zr200 Exp run index (i=f=+)"

	Display /W=(425,193,820,401) sliding_change
	ModifyGraph lblMargin(left)=5,lblMargin(bottom)=2
	Label left "\\Zr150Change of Avg [%]"
	Label bottom "\\Zr150 Window index [100 pnts/wndw]"
	SetAxis left -5,5

	Display /W=(456,402,816,614) sliding_average
	AppendToGraph/R sliding_stddev
	ModifyGraph rgb(sliding_average)=(0,0,0),rgb(sliding_stddev)=(16385,28398,65535)
	ModifyGraph lblMargin(right)=3
	ModifyGraph lblLatPos(right)=-1
	Label left "\\Z20 Window Avg"
	Label bottom "\\Z20Nth window [100 pnts/wndw]"
	Label right "\\Z20 \\K(16385,28398,65535)Window Std Dev"
	SetAxis left*,-0.5
	SetAxis right 6,6.5
	Cursor/P A sliding_average 69;Cursor/P B sliding_average 86

	Display /W=(602,637,997,845) tmp_fft
	ModifyGraph log(left)=1
	Label left "\\Zr200 |FFT|\\S2\\M"
	Label bottom "\\Zr200 f [10 pnts/wndw]"

	// Building Gizmo 7 window...
	NewGizmo/W=(4,354,403,676)
	ModifyGizmo startRecMacro=700
	ModifyGizmo scalingOption=63
	AppendToGizmo Surface=root:sliding_pdf,name=surface0
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
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={0,axisLabelText,"\\Zr125 Nth window [100 pnts/wndw]"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={1,axisLabelText,"\\Zr150 j"}
	ModifyGizmo ModifyObject=axes0,objectType=Axes,property={2,axisLabelText,"\\Zr140 P(j)       \t\t\t\t\t\r"}
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
	ShowTools
	ModifyGizmo endRecMacro
	ModifyGizmo SETQUATERNION={0.470306,-0.278430,-0.431718,0.717575}
	Execute/Q/Z "SetWindow kwTopWin sizeLimit={46,234,inf,inf}" // sizeLimit requires Igor 7 or later
EndMacro

Window graph_tightness() : Graph
	PauseUpdate; Silent 1		// building window...
	Display /W=(436,130,913,488)
	AppendImage/T tightness_single_slice
	ModifyImage tightness_single_slice ctab= {1,2,Geo,0}
	ModifyGraph margin(left)=50,margin(bottom)=14,margin(top)=52,margin(right)=14
	ModifyGraph mirror=2
	ModifyGraph nticks(left)=2,nticks(top)=3
	ModifyGraph minor=1
	ModifyGraph fSize=15
	ModifyGraph lblMargin(top)=2
	ModifyGraph standoff=0
	ModifyGraph lblLatPos(top)=3
	ModifyGraph tkLblRot(left)=90
	ModifyGraph btLen=3
	ModifyGraph tlOffset=-2
	Label left "\\Zr150\\[0\rθ\\BF\\M [π]\\]0"
	Label top "\\Zr150\\[0\rθ\\BA\\M [π]\\]0"
	SetAxis left 0.4,0.6
	SetAxis top 1,0
	Cursor/P/I A tightness_single_slice 13,8
	ShowInfo
	TextBox/C/N=t0/X=1.69/Y=1.66 "\\Zr150\\[0\rθ\\Bρ\\M=π/100\\]0"
	ColorScale/C/N=text0/A=RT/X=66.18/Y=2.38 image=tightness_single_slice, vert=0
	ColorScale/C/N=text0 widthPct=30
	AppendText "\\Zr150 LHS-RHS"
	ModifyGraph swapXY=1
EndMacro


Window graph_check_prob() : Graph
	PauseUpdate; Silent 1		// building window...
	Display /W=(350,428,745,636) prob_j_vs_thetaRho[*][15],prob_j_vs_thetaRho[*][5],pj_A_pi4_rho_0p5_math_v2
	AppendToGraph pj_A_pi4_rho_m0p5_math_v2
	ModifyGraph mode(prob_j_vs_thetaRho)=3,mode(prob_j_vs_thetaRho#1)=3
	ModifyGraph lSize=2
	ModifyGraph rgb(prob_j_vs_thetaRho)=(16385,28398,65535),rgb(prob_j_vs_thetaRho#1)=(52428,1,1)
	ModifyGraph rgb(pj_A_pi4_rho_0p5_math_v2)=(52428,1,1),rgb(pj_A_pi4_rho_m0p5_math_v2)=(16385,28398,65535)
	ModifyGraph fSize=12
	ModifyGraph lblMargin(left)=8
	ModifyGraph axOffset(left)=1
	ModifyGraph lblLatPos(left)=1
	Label left "\\Zr150\\[0\rP(j)\r\\]0"
	Label bottom "\\Zr150\\[0\rj\r\\]0"
	SetAxis bottom -15,15
	TextBox/C/N=text0/X=-8.96/Y=-2.84 "\\Zr150\\[0\rθ\\BA\\M =π/4\r\\s(prob_j_vs_thetaRho) θ\\Bρ\\M = +π/2\r\\s(prob_j_vs_thetaRho#1) θ\\Bρ\\M = -π/2\r\\]0"
	AppendText "\\s(pj_A_pi4_rho_0p5_math_v2) Math.\r\\s(pj_A_pi4_rho_m0p5_math_v2) "
EndMacro

Window graph_RHS_single_run() : Graph
	PauseUpdate; Silent 1		// building window...
	Display /W=(530,45,897,208) RHS_value[*][0],RHS_value[*][3],RHS_value[*][1],RHS_value[*][2]
	ModifyGraph rgb(RHS_value)=(0,65535,65535),rgb(RHS_value#1)=(16385,28398,65535)
	ModifyGraph rgb(RHS_value#2)=(39321,1,1)
	ModifyGraph lblMargin(bottom)=2
	ModifyGraph lblLatPos(left)=7,lblLatPos(bottom)=-2
	Label left "\\Z15\\[0\rRHS (single θ\\Bf\\M, θ\\Ba\\M)"
	Label bottom "\\Z15 Record, j "
	SetAxis left 0,25
	Legend/C/N=text0/J/H={0,2,10}/A=MC/X=-39.83/Y=-4.55 "\\Z15\r\t i,f\r\\s(RHS_value) ++\r\\s(RHS_value#1) --\r\\s(RHS_value#2) +-\r\\s(RHS_value#3) -+"
	TextBox/C/N=t0/X=3.39/Y=0.91 "\\Z12\\[0θ\\Bf\\M= 0.5π\rθ\\Ba\\M= 0.4π\\]0"
EndMacro

function convert_3d_to_gif(in_wave_3d,target_wave)
	// before running; create graph with labels and (fixed) color map
	wave in_wave_3d, target_wave
	variable i, target_index=0
	
	// loop through each slice of image; update labels; save as .png
	for (i=0; i<dimsize(target_wave,target_index); i+=1)
		// get single slice
		target_wave[][] = in_wave_3d[i][p][q]
		doUpdate
		
		// update label
		variable x_scale = indexToScale(in_wave_3d,i,target_index)
		// round by 2 digits.
		variable decimal = mod(x_scale,0.01)
		x_scale += decimal
		x_scale -= mod(x_scale,0.01)
		string tt = num2str( x_scale )
		textbox/c/n=t314159 "\Zr150\[0θ\Ba\M ="+tt+"π\]0"
		
		// create file name
		string file_name="gif_00.png"
		string i_str = num2str(i)
		if (strlen(i_str)<2)
			i_str = "0"+i_str
		endif
		variable start_index = strlen("gif_")
		file_name[start_index, start_index+1] = i_str

		// save output
		Sleep 00:00:00.1
		//SavePICT/O/P=igor_1/E=-5/B=144/I/W=(0,0,8.8,7) as file_name		
	endfor
end 
