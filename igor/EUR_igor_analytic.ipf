#pragma TextEncoding = "MacRoman"
#pragma rtGlobals=3		// Use modern global access method and strict wave access.

function get_rhs_analytic(min_theta_a, max_theta_a, min_theta_f, max_theta_f, dtOverTau,bin_size)
	variable min_theta_a, max_theta_a
	variable min_theta_f, max_theta_f
	variable dtOverTau, bin_size
	//print "This value is only Term 1 of RHS"
	
	variable num_a=150, num_f=150
	make/o/n=(num_f) theta_f
	make/o/n=(num_a) theta_a
	make/o/n=(num_a,num_f) rhs_analytic
	
	setscale/i x, min_theta_a, max_theta_a, theta_a
	setscale/i x, min_theta_f, max_theta_f, theta_f
	theta_a = x	
	theta_f = x
	
	variable i, j,k, min_val, current_rhs, ii, ff, ta,tf, current_min
	for (i=0; i<num_a; i+=1)
		for (j=0; j<num_f; j+=1)
			ta = theta_a[i]
			tf = theta_f[j]
			// select minimum of I, F outcomes (j is analtically optimized)
			min_val = inf
			//for (k=0; k<4; k+=1)
			k=1 // i=f=-
				ii = floor(k/2)
				ff = mod(k,2)
				ii = 2*ii - 1; ff = 2*ff - 1
				current_rhs = calc_RHS_analytic(ii,ff,ta,tf,dtOverTau, bin_size)
				current_min = min_val
				min_val = min(current_min, current_rhs)
			//endfor
			rhs_analytic[i][j] = min_val
		endfor
	endfor
	
	setscale/i x, min_theta_a/pi, max_theta_a/pi, rhs_analytic
	setscale/i y, min_theta_f/pi, max_theta_f/pi, rhs_analytic				
end //main
				

function calc_RHS_analytic(ii,ff,theta_a, theta_f,dtOverTau,l)
	variable ii,ff, theta_a, theta_f
	variable dtOverTau, l //l is bin size.
	
	variable A_rOptimal, r_optimal, Tr_PIi_PIf, prob_r, g_r
	variable Tr_PIi

	A_rOptimal =  (ii*Cos(theta_a) + ff*Cos(theta_a-theta_f) )
	A_rOptimal /=  1+ii*ff*Cos(theta_f)
	r_optimal = A_rOptimal/ln(2)
	Tr_PIi_PIf = 0.5*( 1+ii*ff*Cos(theta_f) )
	Tr_PIi = 1
	
	prob_r = sqrt(dtOverTau/2/Pi)*exp(-0.5*dtOverTau*(r_optimal^2+1))
	g_r = r_optimal/sqrt(sqrt(pi)) *(0.5*dtOverTau)^1.25 *exp(-0.25*dtOverTau*(r_optimal^2+1))
	g_r *= sqrt(l)
	
	variable term1
	variable term2
	term1 = -log( prob_r * Tr_PIi_PIf)
	term1 /= log(2)
	
	term2 = 2*Tr_PIi/ln(2)/sqrt(prob_r*l) *g_r*A_rOptimal
	
	return term1 + term2
end //RHS
	
	
function make_thy_lhs_proj()
	// follows Maassen-Uffink Relation: H(A) + H(B) > -log(c), c= max overlap
	make/o/n=200 thy_lhs_proj
	variable theta_f_min=0, theta_f_max = 1 // units of pi
	setscale/i x, theta_f_min, theta_f_max, thy_lhs_proj

	// the maximization over eigenstates changes at pi/2 from i=f to i=-f
	// it is simply implemented by a flag of tf > pi/2
	duplicate/o thy_lhs_proj flag_pm
	flag_pm = 0.5+0.5*sign(x-0.5)
	
	// the relation is: 0.5 \pm 0.5 cos(tf)
	thy_lhs_proj = 0.5*( 1 -(-1)^(flag_pm)*cos(x*pi))
	
end