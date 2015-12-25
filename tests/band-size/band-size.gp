reset

set terminal postscript eps color enhanced size 5,3.5 font "Times-Roman" 22
set output 'band_size.eps'

set ylabel 'Latency (ms)'
set xlabel 'Operation Number'

set yrange [0:50]

set border 3 back
set tics nomirror out scale 0.75

set multiplot layout 2,1

plot 'replay_lat.1.log' u 0:($2/1000) t '5s delay'  w l

plot 'replay10_lat.1.log' u 0:($2/1000) t '10s delay'  w l

