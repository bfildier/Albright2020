# Albright2020
Final code version for Albright et al. (2020), Atmospheric radiative profiles during EUREC4A, including scripts to compute radiative profiles and generate figures

## Merging dropsonde and radiosonde data

## Computing radiative profiles from sonde data

0. Add output/ in .gitignore
1. Compile the radiation code
In rte-rrtmgp/build create a Makefile.conf following the template in the folder. Alternatively, you can set environment variables FC and FCFLAGS to be the name of the Fortran compiler and the compilation flags. Invoke make.

2. Compile main script
In Makefile edit the flags NCHOME and NFHOME for your platform. These point to the root of the netCDF C and Fortran installations on your platform. Call make.

3. Run
In script, edit compute_radiation_from_soundings.sh with the path to your sonde file. Run compute_radiation_from_soundings.sh

## Generate paper figures
