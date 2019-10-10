#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Oct  5 15:25:34 2019

@author: jmonroe

This script exists to 
"""
import sys, time, os
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


def some_Fun():
	'''
	DESCRIPTION: 
	INPUT:
	OUTPUT:
	TODO:
	'''
	pass
##END 


def read_mathematica_3d_file(data_path):
    
    with open(data_path) as open_file:
        #read_lines = open_file.readlines()
        data = eval(open_file.readline())
        
    return np.array(data)
##END read_mathematica_3d_file


def movie_from_3d_graph(data_3d,delay=0.2):
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    
    xs = np.arange(0.01, 1, 0.1)
    ys = np.arange(0.01, 1, 0.1)
    xx, yy = np.meshgrid(xs,ys)

    plt.ion()
    plt.show()
    ax.set_xlabel(r"$\theta_\rho [\pi]$")
    ax.set_ylabel(r"$\theta_F [\pi]$")
    for i in range(data_3d.shape[0]):
        plt.cla()
        ax.plot_surface(xx,yy,data_3d[i],cmap='bwr')
        plt.draw()
        plt.draw()
        plt.pause(delay)
    

if __name__ == '__main__':
    data_dir = "/Users/jmonroe/Projects/entropicUncertainty/mathematica/"
    lhs_data= read_mathematica_3d_file(data_dir+"LHS.txt")
    rhs_data= read_mathematica_3d_file(data_dir+"RHS.txt")
    
    rhs_3d = lhs_data.copy()
  
    ## extend RHS into theta_rho dimension (constant) 
    for i in range(10):
        rhs_3d[:, :, i] = rhs_data 

    tightness = lhs_data - rhs_3d
    for j in range(20):
        np.savetxt(data_dir+"data_tightness/tightness{0}.txt".format(j), tightness[j].T)
    #plt.imshow(rhs_3d[:,:,1],cmap='bwr',vmin=5,vmax=6)
    #plt.show()
    #movie_from_3d_graph(rhs_3d)

    

