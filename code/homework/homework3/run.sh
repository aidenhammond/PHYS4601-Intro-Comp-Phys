#!/bin/bash
#SBATCH --job-name=aiden-hammond-phys-6601-homework-1
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=20kb
#SBATCH --time=0:01:00
#SBATCH --output=summary.log

cd $SLURM_SUBMIT_DIR
gfortran *.f
./a.out
