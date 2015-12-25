reset

set terminal postscript eps color enhanced size 5,3.5 font "Times-Roman" 22
set output 'cache_size_ppt.eps'

set xlabel 'Operation Number'
set ylabel "Latency (ms)"

#set xrange[1:1400]
#set yrange[0:30]
set ytics 1000
set xtics 50000

set border 3 back
set tics nomirror out scale 0.75



#set multiplot layout 3,1 rowsfirst

#set tmargin at screen 0.90; set bmargin at screen 0.65
#set ylabel " "
plot "map-size_lat.1.log" u 0:($2/1000) t 'map-size' w l,\
     "cache-size_lat.1.log" u 0:($2/1000) t 'cache-size' w l


#set tmargin at screen 0.66; set bmargin at screen 0.42
#set ylabel "Latency (ms)"
#plot "map-size_lat.1.log" u ($2/1000) t 'map-size' w l

#set ylabel " "
#set xlabel 'Operation Number'
#set tmargin at screen 0.42; set bmargin at screen 0.18
#plot "raw_size_lat.1.log" u 0:($2/1000) t '' w l
