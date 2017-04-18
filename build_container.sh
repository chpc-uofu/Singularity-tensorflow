rm -f ubuntu_tensorflow_gpu.img
sudo singularity create --size 8192 ubuntu_tensorflow_gpu.img
sudo singularity bootstrap ubuntu_tensorflow_gpu.img Singularity
