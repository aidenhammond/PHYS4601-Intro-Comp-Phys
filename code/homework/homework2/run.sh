#!/bin/bash
#SBATCH --job-name=aiden-hammond-phys-6601-homework-1
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=20kb
#SBATCH --time=0:01:00
#SBATCH --output=summary.log

cd $SLURM_SUBMIT_DIR
module load GCC/12.3.0
module load gnuplot/5.4.4-GCCcore-11.3.0
gfortran *.f
time ./a.out

DATAFILE="comparisons.dat"

OUTPUTFILE="comparisons_plot.png"

gnuplot -persist <<-EOFMarker
    set title "Comparison of Series Approximation Error"
    set xlabel "Index"
    set ylabel "Difference"
    set grid
    set term png
    set output "$OUTPUTFILE"
    plot "$DATAFILE" using 1:2 with linespoints title 'Differences', \
         "" using 1:2 with labels notitle offset char 1,1
    set output
EOFMarker
