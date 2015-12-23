reset

set terminal postscript eps color enhanced size 5,3.5 font "Times-Roman" 22
set output 'cleaning_type2.eps'

set ylabel "Latency (ms)"
set xlabel 'Operation Number'

set xrange[1:1400]
set yrange[0:30]


set border 3 back
set tics nomirror out scale 0.75



set multiplot layout 2,1

plot "read-mid_lat.1.log" u 0:($2/1000) t 'read after write' w l, \
     "read-mid-delay1000_lat.1.log" u 0:($2/1000) t 'read after 1000 sec' w l,\
     "read-mid-delay2000_lat.1.log" u 0:($2/1000) t 'read after 2000 sec' w l


set ylabel "#non-seq zone"
set xlabel 'Time (s)'

set xrange[0:3000]
set yrange[0:1600]
plot "clean_type1280.csv" u 1:2 t '#non-seq zone' w l