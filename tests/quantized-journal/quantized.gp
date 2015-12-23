reset

set terminal postscript eps color enhanced size 5,3.5 font "Times-Roman" 22
set output 'quantized.eps'

set ylabel 'Latency (ms)'
set xlabel 'Operation Number'

set xrange [0:4096]
set yrange [0:100]
set ytics 10

set border 3 back
set tics nomirror out scale 0.75

p "rand-write-4K_lat.1.log" u 0:($2/1000) t '4-50KB' w l, \
  "rand-write-51K_lat.1.log" u 0:($2/1000) t '51-102KB' w l, \
  "rand-write-103K_lat.1.log" u 0:($2/1000) t '103K' w l, \
  "rand-write-135K_lat.1.log" u 0:($2/1000) t '135K' w l
