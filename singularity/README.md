# Singularity

Singularity does not require root privileges to run, so for most HPC centers this is a more prefered option compared to Docker.

## Build

Building `alphafold` is simple enough, you can use [spython](https://github.com/singularityhub/singularity-cli) to convert the basics of the `Dockerfile` and then update a few things manually:
   1. Hardcode all CUDA variables
   2. Remove `pushd`/`popd`, replace with `cd`
   3. Add activation of conda environment
   4. Install alphafold via `python setup.py install`
   5. Set max version of tensorflow (ie. tensorflow<=2.5.0) in `setup.py`
   6. Add pip install of `ipykernel` for Jupyter support

Then run the `singularity build ...` command to build the image.
The build step has been scripted within the `build_singularity.sh` script.

## Jupyter

If you want to use the build `alphafold` image under a `Jupyter Notebook` environment then just add the `kernel.json` file to your home directory, here:

```bash
~/.local/share/jupyter/kernels/alphafold/kernel.json
```

Once this file has been placed, update the paths for the `singularity` binary, as well as the `alphafold.sif` image then visit any `Jupyter` instance (ie. [Jupyter Server](https://jupyter.hpcc.ucr.edu), or [Jupyter in a Job](https://github.com/ucr-hpcc/hpcc_slurm_examples/tree/master/jupyter)).
