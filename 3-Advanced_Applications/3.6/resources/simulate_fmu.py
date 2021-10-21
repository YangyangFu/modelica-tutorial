# -*- coding: utf-8 -*-
"""
This module simulate the FMU with parameter changes during simulation controlled by a for loop
"""
# import from future to make Python2 behave like Python3
from __future__ import print_function
# end of from future import

# import numerical package
import numpy as np
import matplotlib
matplotlib.use('agg')
import matplotlib.pyplot as plt
# import fmu package
from pyfmi import load_fmu
# import buildingspy
#from buildingspy.io.outputfile import Reader
#import fncs

# load pickle to save results - cannot be picked FMU2ME object
# import pickle
import os


# simulate setup
time_granted = 0
time_next =0
time_stop = 120. # 120s
startTime = 0
endTime = startTime + time_stop
#dt = 60

## load fmu - cs
name = "test.fmu"
fmu = load_fmu(name)
options = fmu.simulate_options()
options['ncp'] = 500

# initialize output
y = []
tim = []

# input: None

# simulate fmu
#res = fmu.simulate(start_time=startTime, final_time=endTime,input = input_object, options=options)

# simulate fmu using do_step to see if states are stored in fmu
initialize = True

for i in range(2):
    ts = i*60
    options['initialize'] = initialize    
    # set time varying parameters: h
    fmu.set('a', i+1)

    # has to use 3600. instead of 3600, because the former will produce a float number to avoid integrator errors in jmodelica. 
    res_step = fmu.simulate(start_time=ts, final_time=ts+60., options=options)
    initialize = False
    print (len(res_step['y']))
    print (res_step['y'])
    print (res_step['time'])

    y.extend(res_step['y'])
    tim.extend(res_step['time'])


print ('Finish simulation')

# post-process
# plot 
fig = plt.figure()
fig.add_subplot(111)
plt.plot(np.array(tim),np.array(y))
plt.savefig('result.pdf')
plt.close()	

# read results using buildingspy
# res = Reader(output+'res60.mat','dymola')
# t,power = res.values('fanSup.P')
# print power

