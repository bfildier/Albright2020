#!/bin/bash

# by Ben Fildier and Ludovic Touze-Peiffer
# Uses radiative transfer code by Robert Pincus to calculate
# radiative profiles from HALO dropsonde data


wdir=${PWD%/*}
cdir=${wdir}/code

# Replace with the path to your input file   

# ifile= # full path to all_sondes.nc
# odir=${wdir}/output/rad_profiles
# ERAdir= # full path to ERA input data

ERAdir=/Users/bfildier/Data/EUREC4A/ERA
ifile=/Users/bfildier/Data/EUREC4A/merged/sondes/all_sondes.nc
odir=${wdir}/output/rad_profiles


mkdir -p ${odir}

#- combine with ERA
python combine_ERA_and_sonde_profiles.py --sonde_file=${ifile} --out_dir=${odir} --ERA_dir=${ERAdir}

#- compute radiative fluxes
for ofile in `ls ${odir}/*.nc`; do
             echo 'Compute radiation profile '$ofile
             ${cdir}/sonde_radiation $ofile
             echo " "
   done

#- calculate heating rates
python post_processing.py --in_dir=${odir} --out_dir=$odir --comp_qrad=True

#To compute the radiative heating itself, run instead

#python post_processing.py --in_dir="../output/rad_profiles" --out_dir="../output/" --comp_qrad=True

