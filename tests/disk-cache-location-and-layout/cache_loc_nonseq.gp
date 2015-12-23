reset

set terminal postscript eps color enhanced size 5,3.5 font "Times-Roman" 22
set output 'cache_loc_nonseq.eps'

set ylabel "Latency (ms)"
set xlabel 'Operation Number'


set yrange[0:39]
set xrange[1:1024]
set ytics 10

set border 3 back
set tics nomirror out scale 0.75

plot "read-low-nonseq_lat.1.log" u 0:($2/1000) t 'low offset nonseq' w l, \
     "read-mid-nonseq_lat.1.log" u 0:($2/1000) t 'mid offset nonseq' w l, \
     "read-high-nonseq_lat.1.log" u 0:($2/1000) t 'high offset nonseq' w l
