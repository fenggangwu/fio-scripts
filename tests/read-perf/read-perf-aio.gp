reset

set terminal postscript eps color enhanced size 5,3.5 font "Times-Roman" 22
set output 'read_perf_aio.eps'

set ylabel 'Latency (ms)'
set xlabel 'Operation Number'

set xrange [0:4096]
set yrange [0:40]
#set ytics 20

set border 3 back
set tics nomirror out scale 0.75

set multiplot layout 2,1
p "rand-write-aio_lat.1.log" u 0:($2/1000) t 'write-aio' w l
p "rand-read-aio_lat.1.log" u 0:($2/1000) t 'read' w l  

