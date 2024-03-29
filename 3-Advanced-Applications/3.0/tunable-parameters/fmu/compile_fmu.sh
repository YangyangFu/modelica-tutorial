docker run \
	--user=root \
	--detach=false \
	-e DISPLAY=${DISPLAY} \
	-v /tmp/.X11-unix:/tmp/.X11-unix\
	--rm \
	-v `pwd`:/mnt/shared \
	-i \
	-t \
	modelica_tutorial /bin/bash -c "cd /mnt/shared && python2 /mnt/shared/compile_fmu.py"