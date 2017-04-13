#!/bin/bash
#SBATCH -n 1            
#SBATCH -N 1
#SBATCH -A kingspeak-gpu
#SBATCH -p kingspeak-gpu
#SBATCH --gres=gpu:k80:1
#SBATCH -t 0:10:00      # change to the anticipated runtime

nvidia-smi
ml purge
ml tensorflow/1.0.1.gpu

# cd to the directory where we want to run
cd /uufs/chpc.utah.edu/common/home/u0101881/containers/singularity/containers/chpc/tensorflow/example
# 
tensorflow-gpu helloworld.py

