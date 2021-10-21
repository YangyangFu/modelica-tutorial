# modelica-tutorial
A tutorial repo for modeling, simulation and optimization in Modelica/FMU environments

# Syllabus

## Section 1 - Introduction on Modelica

## Section 2 - Debugging Modelica Models

## Section 3 - Advanced Applications
This section talks about how to use Modelia/FMU models to perform different advanced applications, including design optimization (e.g., system sizing, model calibration etc), simulation restart from a given states, pertubation experiment (e.g., system excitation for system identification) and optimal control (e.g., model predictive control of a target system) etc..

### Section 3.0 Some Basics

states

tunable parameters

Modelica compilers 

FMU

### Section 3.1 Modelica-based Design Optimization 

### Section 3.2 Modelica-based Simulation Restart

### Section 3.3 Modelica-based Pertubation Experiment

### Section 3.4 Modelica-based Optimal Control 

perfect model

imperfect model

### Section 3.5 FMU-based Design Optimization


### Section 3.6 FMU-based Simulation Restart 


### Section 3.7 FMU-based Pertubation Experiment


### Section 3.8 FMU-based Optimal Control

perfect model

imperfect model

### Section 3.9 FMU-based Co-simulation among Different Simulators

# Software Installation
The testing examples are mostly written in Python, and the physical models are written in Modelica. 
Two integrated software environment are provided here for tutorial purposes.
One is a containerized docker environment that contains jModelica for Modelica modeling and simulation, and a Python 3.8 scripting envrionment. 
The other is a Python 3.8 conda environment, which contains only Python and no Modelica tools. 
This environment is only designed for examples depending on Dymola or Dymola FMU. 
Dymola is similar to jModelica but a commercial tool.

## Docker Environment
The docker contains an integrated Modelica modeling and simulation environment in Python based on jModelica.

1. Install prequirements

    Docker: https://docs.docker.com/get-docker/. 
    
    Make: 
        
        for windows, use cygwin from https://www.cygwin.com/

2. Activate docker. Just open the installed Docker desktop.

3. Make an image for tutorial purposes by opening a terminal, directing to the top folder `modelica-tutorial`, and typing:
    
   ```
   make build
   ``` 

4. Check the image after build by typing:
   ```
   docker image ls
   ```

   If successfully build, this should return a list of images on the local computer with an image repository named `modelica_tutorial`.

5. Test the Docker environment by directing to any sub-folders and type:
   
   on windows: 
   ```
   XXXX.bat
   ```

   on Mac/Ubuntu:
   ```
   bash XXXX.sh
   ```

## Conda Environment
The library dependency has been configured and listed in the `modelica_tutoral.yml` file. 

1. Make sure `conda` is installed in the local computer by opening your favorite terminals and typing:

    ```
    conda info
    ```

    If sucessfully installed, similar messages as follows should be returned:

        active environment : base
        active env location : C:\tools\Anaconda2
        shell level : 1
        user config file : C:\Users\yangyang.fu\.condarc
        populated config files :
        conda version : 4.8.3
        conda-build version : 3.18.9
        python version : 2.7.16.final.0
        virtual packages : __cuda=11.3
        base environment : C:\tools\Anaconda2  (writable)
        channel URLs : https://repo.anaconda.com/pkgs/main/win-64
                            https://repo.anaconda.com/pkgs/main/noarch
                            https://repo.anaconda.com/pkgs/r/win-64
                            https://repo.anaconda.com/pkgs/r/noarch
                            https://repo.anaconda.com/pkgs/msys2/win-64
                            https://repo.anaconda.com/pkgs/msys2/noarch
        package cache : C:\tools\Anaconda2\pkgs
                        C:\Users\yangyang.fu\.conda\pkgs
                        C:\Users\yangyang.fu\AppData\Local\conda\conda\pkgs
        envs directories : C:\tools\Anaconda2\envs
                            C:\Users\yangyang.fu\.conda\envs
                            C:\Users\yangyang.fu\AppData\Local\conda\conda\envs
        platform : win-64
        user-agent : conda/4.8.3 requests/2.22.0 CPython/2.7.16 Windows/10 Windows/10.0.19041
        administrator : False
        netrc file : None
        offline mode : False   

    If conda is not sucessfully installed, please check https://conda.io/projects/conda/en/latest/user-guide/install/index.html.


2. Configure the provided environment in `modelica_tutorial.yml` by directing to the top folder `modelica-tutorial` and typing:

    ```
    conda env create -f modelica_tutorial.yml
    ```
3. Check the installation by typing:

    ```
    conda env list
    ```

    If installed correctly, users should be able to see a conda environment named `modelica_tutorial` being returned.

4. Activate `modelica_tutoral` virtual environment if the environment has been successfully installed. Type in the terminal:

    ```
    conda activate modelica_tutoral
    ```
5. Test example codes. Now the users can direct to any sub-folders to test the example scripts written in Python by typing
   
   ```
   python xxxx.py
   ```

    If the scripts call FMUs, then the FMUs has to be regenerated on the local computer using Dymola.

# Contact

Yangyang Fu

fuyy2008@gmail.com
