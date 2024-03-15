gfortran -std=legacy radioactive_decay.f
./a.out >> t_step_$1.dat
sh generate_gnuplot_graph.sh $1 $2