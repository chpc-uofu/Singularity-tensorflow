rm -f ubuntu_tensorflow_gpu.img
sudo /uufs/chpc.utah.edu/sys/installdir/singularity/2.3.1/bin/singularity create --size 4096 ubuntu_tensorflow_gpu.img
sudo /uufs/chpc.utah.edu/sys/installdir/singularity/2.3.1/bin/singularity bootstrap ubuntu_tensorflow_gpu.img Singularity
singularity exec --nv ubuntu_tensorflow_gpu.img /usr/bin/python -c "import tensorflow as tf;s = tf.Session()"
