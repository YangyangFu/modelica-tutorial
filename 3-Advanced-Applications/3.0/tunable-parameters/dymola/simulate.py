# -*- coding: utf-8 -*-
"""
Created on Wen Nov 24 00:56:00 2021
@author: Yangyang Fu
###
### simulate Modelica models in Dymola with tunable parameters
"""
#%% import 
from buildingspy.simulate.Simulator import Simulator
from buildingspy.io.outputfile import Reader
import os, shutil
import numpy as np
import matplotlib.pyplot as plt

#%% define equations
def translate(model,packagePath):
	# Check input files: if before translation, input files exsit, then delete them.
	fileList=[packagePath+'./dymosim.exe',packagePath+'/tunable-parameter.txt',
			  packagePath+'/initial-states.txt']
	for fil in fileList:
		if os.path.exists(fil):
			os.remove(fil)
	## Translate model to get dymosim.exe and dsin.txt
	## ----------------------------------------------------------------------------
	# delete input file before transltion
	s = Simulator(model, "dymola",packagePath)
	s.setOutputDirectory(packagePath)
	# choose to show Dymola GUI
	s.showGUI(show=False)
	# translate the model
	s.printModelAndTime()
	# This attribute exists only in my buildingpy library
	#s.chooseCurWorDir(curWorDir= True)
	s.translate()

	# copy dymosim.exe and dsin.txt into current package path
	translate_path = s._translateDir_
	print(translate_path)
	shutil.move(translate_path+'/dymosim.exe',packagePath+'/dymosim.exe')
	shutil.move(translate_path+'/dsin.txt',packagePath+'/dsin.txt')
	shutil.move(translate_path+'/translator.log',packagePath+'/translator.log')
	# delete temporary folder: the relative path is compiled into the model. Therefore, don't delete the temporary folder before simulation is performed.
	#s._deleteTemporaryDirectory(translate_path)
	return s

def simulate_translated(packagePath,startStates,x,start_time,end_time,solver):
	'''Simulate translated modelica model: 
	0- assume the new states are updated before calling this function
	1- write a design variable file
	2- write simulation time into dsin.txt
	3- simulate model
	4- read results
	#####
	### x: control inputs: x-chiller capacity
	'''
	# 1. write tunable parameter from given value   

	f=open(packagePath+'/tunable-parameter.txt','w')
	f.seek(0,0)	
	f.write("a = %f;\n"%x)  
	f.close() 
	
	# write initial states
	f=open(packagePath+'/initial-states.txt','w')
	for i in range(len(startStates)):
		f.writelines(startStates[i]) 
	f.close()	
	
	# 2. Write the simulation time     
	f=open(packagePath+'/dsin.txt','r') 
	lines=f.readlines()
	f.close()
	# change the simulation start and end time in dsin.txt
	lines[9] = "    %d                   # StartTime    Time at which integration starts\n" %(start_time)
	lines[11]= "    %d                   # StopTime     Time at which integration stops\n" %(end_time)
	lines[18] = "      %d                   # Algorithm    Integration algorithm as integer (1...28)\n" %(solver)    
	# write the new simulation time into dsin.txt
	f=open(packagePath+'/dsin.txt','w')
	for i in range(len(lines)):
		f.writelines(lines[i])
	f.close()  

	# 3. simulate the model: generate dsres.mat
	os.system(packagePath+'/dymosim.exe ' + packagePath+'/dsin.txt') 

	# 4. read in the mat file
	res = Reader(packagePath+'/dsres.mat','dymola')
	t, y = res.values('y') 

	# save as a list of tuples
	out = [(t,y)]
	
	# update states
	f=open(packagePath+'/next-states.txt','r')
	next_states=f.readlines()
	f.close()
	
	return out, next_states 

#%% model settings
cwd = os.path.dirname(os.path.realpath(__file__))
model = "test"
solver = 8 
#%% translate model
s = translate(model, cwd)

#%% main loop for simulating model with changing parameters
a=[1,2,3]
t = [0,1,2]

# initialize states
f=open(cwd+'/initial-states-template.txt','r')
initial_states=f.readlines()
f.close()

# initialize output
to = []
yo = []
# main loop
for i in np.arange(len(a)):
	# define parameters for current step
	x = a[i]
	ts = t[i]
	te = ts + 1.

	# simulate current step
	print("initial states:",initial_states)
	print('x',x)
	out, next_states = simulate_translated(cwd, initial_states,x,ts,te,solver)
	print("next states:", next_states)
	to += list(out[0][0])
	yo += list(out[0][1])

	# update initial states for next step
	initial_states = next_states
	
#%% plot results
plt.figure()
plt.plot(to, yo)
plt.xlabel('t')
plt.ylabel('y')
plt.savefig('result.pdf')