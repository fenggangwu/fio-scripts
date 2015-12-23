include ../parameters.mk

all:
	sudo hdparm -a0 -A0 -W0 -Q1 $(DEVICE)

	sudo fio write.fio --filename=$(DEVICE)
	sudo fio read.fio --filename=$(DEVICE) \
		--write_lat_log=read-mid
	sudo $(libzbc_bin)/record_finer.sh 10 nonseq_log.csv &

	sleep 50
	sudo fio read.fio --filename=$(DEVICE) \
		--write_lat_log=read-mid-delay

	gnuplot cleaning-type3.gp
	evince cleaning_type3.eps &

reset:
	sudo $(libzbc_bin)/reset_write_ptr_all.sh $(DEVICE)

plot:
	gnuplot cleaning-type3.gp
	evince cleaning_type3.eps &

replot:
	gnuplot cleaning-type3.gp

clean:
	rm -rf *.log *.eps
