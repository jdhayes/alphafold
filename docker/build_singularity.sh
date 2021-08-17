#!/bin/bash

# Install spython
echo "Checking for spython"
if ! command -v spython &> /dev/null; then
    pip3 install spython --user
fi

# Convert file
echo "Checking for Singularity.def"
if [[ ! -f Singularity.def ]]; then
    spython Dockerfile &> Singularity.def
fi

# Replace CUDA and CUDA_VERSION with static numbers
#sed -i 's/\$\{CUDA\}/11.0/g' Singularity.def
#sed -i 's/\$\{CUDA_VERSION\}/11.0/g' Singularity.def
# Remove pushd/popd

# Symlink shared singularity path, enabling cache
echo "Checking for root singulairty cache"
sudo bash -l -c "if [[ -d /root/.singularity ]]; then rm -rf /root/.singularity; fi"
sudo ln -s /bigdata/operations/root/singularity /root/.singularity

# Build singularity image
echo "Building singularity image"
rm -f alphafold.sif
sudo bash -l -c "module -s load singularity/3.7.3; singularity build alphafold.sif Singularity.def &> singularity.log"

