-- -*- lua -*-
-- Written by MC on 3/15/2017
help(
[[
This module sets up tensorflow-gpu container by aliasing the container call to the tensorflow-gpu command

Run as "tensorflow-gpu myprogram.py".
]])

load("singularity")
local TFPATH="/uufs/chpc.utah.edu/sys/installdir/tensorflow/1.0.1-cp27"

setenv("SINGULARITY_BINDPATH","/scratch,/uufs/chpc.utah.edu")
setenv("SINGULARITY_SHELL","/bin/bash")
local bashStr = TFPATH .. '/ubuntu_tensorflow_gpu.img "$@"' 
set_shell_function("tensorflow-gpu",bashStr,TFPATH .. "/ubuntu_tensorflow_gpu.img $*")
set_shell_function("tensorflow-gpu-shell","singularity shell " .. bashStr,"singularity shell " .. TFPATH .. "/ubuntu_tensorflow_gpu.img $*")

whatis("Name        : TensorFlow GPU")
whatis("Version     : 1.0.1")
whatis("Category    : An open-source software library for Machine Intelligence")
whatis("URL         : https://www.tensorflow.org")
