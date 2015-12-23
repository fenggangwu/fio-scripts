reset

set terminal postscript eps color enhanced size 5,3.5 font "Times-Roman" 22
set output 'cleaning_type.eps'

set ylabel "Latency (ms)"
set xlabel 'Operation Number'

set yrange[1:1024]
set yrange[0:39]


set border 3 back
set tics nomirror out scale 0.75

#unset key

plot "read-mid_lat.1.log" u 0:($2/1000) t 'read after write' w l, \
     "read-mid-delay_lat.1.log" u 0:($2/1000) t 'read after 3 sec' w l
