#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on 2019, Oct 14

@author: jmonroe

This script exists to implement EUR semi-analytic calculations in python
"""
import sys, time, os
import numpy as np
import matplotlib.pyplot as plt
import scipy
from scipy import linalg


def some_Fun():
	'''
	DESCRIPTION: 
	INPUT:
	OUTPUT:
	TODO:
	'''
	pass
##END 

cos = np.cos
sin = np.sin

def main():
    ### DEFINE CONSTANTS
    el = 0.25 # bin size
    rmax = 20 # maximum outcome for weak measurement; sets integration bound
    dt = 0.1
    tau = 1.
    
    ### DEFINE OPERATORS
    pauli_z = np.array( [[1, 0], [0, -1]] ) 
   
    ## th == theta 
    def rho(th_rho):
        return np.matrix( \
            [[cos(th_rho/2.)**2,        cos(th_rho/2.)*sin(th_rho/2.)],\
            [cos(th_rho/2.)*sin(th_rho/2.),   sin(th_rho/2.)**2 ]] )

    I_up = 0.5 *(np.eye(2) + pauli_z) 
    I_down = 0.5 *(np.eye(2) - pauli_z) 

    def A_op(th_a):
        return np.matrix( \
            [[cos(th_a), sin(th_a)], \
            [ sin(th_a), -cos(th_a)]])

    def F_op(th_f):
        return np.matrix( \
            [[cos(th_f), sin(th_f)], \
            [ sin(th_f), -cos(th_f)]])

    def M_r_op(r, th_a):
        ## construct the Gaussian Kraus operator by pieces
        norm = np.sqrt(el) *pow(dt/(2*pi*tau), 0.25) 
        square = scipy.linalg.matrix_power( r*np.eye(2) - A_op(th_a), 2)
        exp_arg = -dt/4/tau *square
        return  norm*scipy.linalg.expm( exp_arg )

    def M_r_dag_op(r, th_a):
        return M_r_op(-r, th_a)
##END main
    

if __name__ == '__main__':
    main()
