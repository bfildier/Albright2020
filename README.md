# Albright2020
Final code version for Albright et al. (2020), Atmospheric radiative profiles during EUREC4A, including scripts to compute radiative profiles and generate figures appearing in the article.

## Merging of dropsonde and radiosonde data

For convenience, the merging was done to generate radiative profiles for all soundings retrieved during EUREC4A. Use file all_sondes.nc to replicate, or use any sounding file with the same variable names.

## Compute radiative profiles from sonde data

0. Add output/ in .gitignore.

1. Compile the radiation code in rte-rrtmgp/build
In rte-rrtmgp/build, create a Makefile.conf following the template present in the folder corresponding to your Fortran compiler. Alternatively, you can set environment variables FC and FCFLAGS to be the name of the Fortran compiler and the compilation flags. Call make.

2. Compile main script in code/
In Makefile edit the flags NCHOME and NFHOME for your platform. These point to the root of the netCDF C and Fortran installations on your platform. Call make.

3. Run
In script, edit compute_radiation_from_soundings.sh with the path to your sonde file (ifile) and to the ERA5 background thermodynamics used as input (ERAdir). Load your python environment, then run compute_radiation_from_soundings.sh. The output is output/rad_profiles/all_rad_profiles.nc.

## Generate paper figures

0. Download MODIS images using scripts/download_MODIS_images.sh

1. Run script Fig*.py corresponding to the figure of interest.
