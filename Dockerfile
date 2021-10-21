FROM yangyangfu/jmodelica_py3
LABEL maintainer yangyangfu(yangyang.fu@tamu.edu)

USER root
# Install plot library
# create a conda environment install pyfmi for load fmu 
RUN conda update conda && \
    conda config --add channels conda-forge && \
    conda install matplotlib

# Change back to user
USER developer
WORKDIR $HOME

# Avoid warning that Matplotlib is building the font cache using fc-list. This may take a moment.
# This needs to be towards the end of the script as the command writes data to
# /home/developer/.cache
RUN python -c "import matplotlib.pyplot"