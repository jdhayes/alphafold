#!/bin/bash -l

module load singularity

singularity exec --nv alphaofold.sif nvidia-smi
