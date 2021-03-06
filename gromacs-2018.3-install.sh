#!/bin/bash

# Usage:  bash gromacs-2018.3-install.sh

# Check it out: 
# https://www.nvidia.com/en-gb/data-center/gpu-accelerated-applications/gromacs/
# http://manual.gromacs.org/documentation/2018/install-guide/index.html
# http://manual.gromacs.org/documentation/

# Note: make sure you have already installed NVIDIA-ubuntu drivers and NVIDIA-toolkit, as well as the OPENCL included, for GPU mode.

wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-2018.3.tar.gz
tar -xzvf *.tar.gz
mkdir build
cd build
cmake .. -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON -DGMX_MPI=ON -DGMX_GPU=on -DGMX_USE_OPENCL=ON -DGMX_OPENMP=ON
#optionally: cmake .. -DGMX_GPU=ON -DGMX_BUILD_OWN_FFTW=ON
# if you find a problem with g++ version (7) pass the following commands:
# sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 10
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 10
make 
make check
sudo make install

# Finally, we need to export it to the PATH:
# PATH="your-dir/gromacs-2018.3/build/bin:$PATH"

# Anotheroption is to provide an alias to the path:
# alias gmx_mpi='your-dir/gromacs-2018.3/build/bin/./gmx_mpi'
