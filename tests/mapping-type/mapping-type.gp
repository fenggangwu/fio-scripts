reset

set terminal postscript eps color enhanced size 5,4.5 font "Times-Roman" 22
set output 'mapping-type.eps'




set border 3 back
set tics nomirror out scale 0.25

set yrange [0:20]
set ytics 10

set multiplot layout 3,1
set ylabel " "
plot "before_lat.1.log" u 0:($2/1000) t 'after seq write zone A and B' w l
set ylabel "Latency (ms)"
plot "mid_lat.1.log" u 0:($2/1000) t 'right after nonseq write zone B' w l
set ylabel " "
set xlabel 'Operation Number'
plot "after_lat.1.log" u 0:($2/1000) t '5s after nonseq write zone B' w l
