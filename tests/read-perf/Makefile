include ../parameters.mk

all:
	sudo hdparm -a0 -A0 -W0 -Q31 $(DEVICE)
	./mktrace.py $(DEVICE)
	sudo fio write-aio.fio --write_lat_log=rand-write-aio
	sudo fio read.fio  --write_lat_log=rand-read-aio
	sudo hdparm -a0 -A0 -W0 -Q1 $(DEVICE)
	sudo fio write-sync.fio --write_lat_log=rand-write-sync
	sudo fio read.fio  --write_lat_log=rand-read-sync
	gnuplot read-perf-aio.gp
	gnuplot read-perf-sync.gp
	evince read-perf-aio.eps &
	evince read-perf-sync.eps &
	sudo $(libzbc_bin)/reset_write_ptr_all.sh $(DEVICE)

plot:
	gnuplot read-perf-aio.gp
	gnuplot read-perf-sync.gp
	evince read_perf_aio.eps &
	evince read_perf_sync.eps &

replot:
	gnuplot read-perf-aio.gp
	gnuplot read-perf-sync.gp

clean:
	rm -rf *.eps *.log
