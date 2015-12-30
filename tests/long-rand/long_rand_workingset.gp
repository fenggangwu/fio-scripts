reset

set terminal postscript eps color enhanced size 10,7 font "Times-Roman" 22
set output 'long_rand_workingset.eps'

#set ylabel "Latency (ms)"
#set xlabel 'Operation Number'

#set xrange[1:1400]
#set yrange[0:30]


set border 3 back
set tics nomirror out scale 0.75


set xlabel 'Time (s)'

set multiplot layout 4,2

set ylabel "BW (MB/s)"
plot "zone8_w_cache_bw.1.log" u ($1/1000):($2/1000) notitle  pt '.' w l
set ylabel "#non-seq zone"
plot "nonseq_zone8_w_cache.csv" u 1:2 notitle w l

set ylabel "BW (MB/s)"
plot "zone256_w_cache_bw.1.log" u ($1/1000):($2/1000) notitle  pt '.' w l
set ylabel "#non-seq zone"
plot "nonseq_zone256_w_cache.csv" u 1:2 notitle w l

set ylabel "BW (MB/s)"
plot "zone8_wo_cache_bw.1.log" u ($1/1000):($2/1000) notitle  pt '.' w l
set ylabel "#non-seq zone"
plot "nonseq_zone8_wo_cache.csv" u 1:2 notitle w l

set ylabel "BW (MB/s)"
plot "zone256_wo_cache_bw.1.log" u ($1/1000):($2/1000) notitle  pt '.' w l
set ylabel "#non-seq zone"
plot "nonseq_zone256_wo_cache.csv" u 1:2 notitle w l
