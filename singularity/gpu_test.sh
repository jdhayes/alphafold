#!/bin/bash -l

module load singularity

singularity exec --nv alphafold.sif nvidia-smi
