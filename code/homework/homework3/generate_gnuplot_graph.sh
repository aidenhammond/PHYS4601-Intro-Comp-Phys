dt=$1
dt_p=$2
data_file="t_step_${dt}.dat"
out_file="decay_plot_${dt}.png"
touch "${out_file}"

PLOT_SCRIPT="set terminal pngcairo enhanced color font 'Arial,10'
set output '${out_file}'
set multiplot layout 2,1 title 'Number of NA/NB Nuclei and Differences Over Time (dt = ${dt_p})'

set grid
set xlabel 'Time (sec)'
set ylabel 'Number of Nuclei'
plot '${data_file}' using 1:2 title 'N_A (Euler)' with lines, \\
     '${data_file}' using 1:3 title 'N_B (Euler)' with lines, \\
     '${data_file}' using 1:4 title 'N_A (Analytic)' with lines, \\
     '${data_file}' using 1:5 title 'N_B (Analytic)' with lines

set ylabel 'Difference in Nuclei'
plot '${data_file}' using 1:6 title 'dN_A (Euler - Analytic)' with lines, \\
     '${data_file}' using 1:7 title 'dN_B (Euler - Analytic)' with lines

unset multiplot"

echo "${PLOT_SCRIPT}" | gnuplot
echo "${PLOT_SCRIPT}"
