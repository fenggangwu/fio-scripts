include ../parameters.mk

all:
	sudo hdparm -a0 -A0 -W0 -Q1 $(DEVICE)
#	./mktrace.py $(DEVICE) $(MID_OFFSET) $(ESTIMATE) $(ACCURACY)
	./mktrace.py $(DEVICE) $(MID_OFFSET) 2097152 262144
#	sudo $(libzbc_bin)/record_finer.sh 5 $(DEVICE) &
	sudo fio replay.fio --read_iolog=write.trace
	sleep 5
	sudo fio replay.fio --read_iolog=read.trace \
		--write_lat_log=replay
	sleep 5
	sudo fio replay.fio --read_iolog=read.trace \
		--write_lat_log=replay10
	gnuplot band-size.gp
	evince band_size.eps &

reset:
	sudo $(libzbc_bin)/reset_write_ptr_all.sh $(DEVICE)

plot:
	gnuplot band-size.gp
	evince band_size.eps &

replot:
	gnuplot band-size.gp

clean:
	rm -rf *.log *.eps
