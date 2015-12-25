reset

set terminal postscript eps color enhanced size 5,3.5 font "Times-Roman" 22
set output 'non_seq_full.eps'

set xlabel 'Time (s)'
set ylabel '#non-seq zones'

set border 3 back
set tics nomirror out scale 0.75

unset key

plot 'nonseq.csv' u 1:2 w l
