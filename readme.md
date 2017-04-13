Create TensorFlow singularity container at CHPC CentOS7 machines

Important detail for GPU support - the container must have the same version of NVidia libraries as the host. These libraries are part of the NVidia driver package, and include libcuda.so and others (the CUDA distribution does not supply libcuda.so).

CHPC specifics as of March 2017 - using CentOS7 RPM package for NVidia driver libraries, which version (367.48) differs from the multi-distro binaries. Therefore we need to extract the NVidia libraries from RPM.

Required packages:
- NVidia driver libraries RPM - xorg-x11-drv-nvidia-libs-367.48-1.el7.x86_64.rpm
- CUDA installer - cuda_8.0.44_linux.run
- CUDNN libraries - cudnn-8.0-linux-x64-v5.1.tgz

Copy these files in the same directory where the other files are.

To build the container, one needs to have sudo access to the singularity command, which all hpcapss members should.
After "ml singularity", run build_container.sh. This does the following:
- creates the container image
- installs NVidia libraries, CUDA and CUDNN, sets LD_LIBRARY_PATH appropriately and installs necessary packages
- installs TensorFlow dependencies and TensorFlow itself

To start the container, as user:
ml singularity
singularity shell -B /scratch -s /bin/bash ubuntu_tensorflow_gpu.img

Then test how NumPy was built and check if TensorFlow can see the GPU by running "python testtf.py".

Useful links:
- Clemson GitHub singularity recipes: https://github.com/clemsonciti/singularity-images
- Discussion on NVidia driver version and TF build: https://groups.google.com/a/lbl.gov/forum/#!topic/singularity/CezfXNjLGe0
- NVidia CentOS 7 RPMs: http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/
- TF install URLs: https://www.tensorflow.org/install/install_linux#the_url_of_the_tensorflow_python_package
- TF tutorials: https://www.tensorflow.org/tutorials
- TF examples: https://github.com/aymericdamien/TensorFlow-Examples

Note on GPU drivers

- can use drivers from the host (as long as they are binary compatible - tested between Ubuntu 14 and CentOS7)
mkdir nvidia
singularity shell -B /usr/lib64/nvidia:`pwd`/nvidia -s /bin/bash /uufs/chpc.utah.edu/sys/installdir/tensorflow/1.0.1-cp27/ubuntu_tensorflow_gpu.img
export LD_LIBRARY_PATH=`pwd`/nvidia:$LD_LIBRARY_PATH
- to be failsafe, can keep the drivers from the existing container, but define ones from the host as above 

Things to resolve
 - in the module, can create an alias to container run command or execute it directly, e.g.
   http://singularity.lbl.gov/docs-run
 - mounting /uufs file systems like sys or group space
 - where does Lmod errors when starting shell come from?
 - bind /usr/lib64/nvidia directly and add to LD_LIBRARY_PATH
 - ?? benchmark/compare to Wim's build ??
