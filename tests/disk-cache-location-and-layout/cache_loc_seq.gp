reset

set terminal postscript eps color enhanced size 5,3.5 font "Times-Roman" 22
set output 'cache_loc_seq.eps'

set ylabel "Latency (ms)"
set xlabel 'Operation Number'


set yrange[0:39]
set xrange[1:1024]
set ytics 10

set border 3 back
set tics nomirror out scale 0.75

plot "read-low-seq_lat.1.log" u 0:($2/1000) t 'low offset seq' w l, \
     "read-mid-seq_lat.1.log" u 0:($2/1000) t 'mid offset seq' w l, \
     "read-high-seq_lat.1.log" u 0:($2/1000) t 'high offset seq' w l
