include ../parameters.mk

cache-raw-size:
	sudo hdparm -a0 -A0 -W0 -Q1 $(DEVICE)
	sudo $(libzbc_bin)/record_finer.sh 60 nonseq_raw_size.csv &
	sudo fio write.fio --bs=4k --iodepth=1 --filename=$(DEVICE) \
		--write_lat_log=raw_size

map-size:
	sudo hdparm -a0 -A0 -W0 -Q31 $(DEVICE)
	sudo $(libzbc_bin)/record_finer.sh 60 nonseq_map_size.csv &
	sudo fio write.fio --bs=4k --iodepth=31 --filename=$(DEVICE) \
		--write_lat_log=map-size

cache-size:
	sudo hdparm -a0 -A0 -W0 -Q31 $(DEVICE)
	sudo $(libzbc_bin)/record_finer.sh 60 nonseq_cache_size.csv &
	sudo fio write.fio --bs=256k --iodepth=31 --filename=$(DEVICE) \
		--write_lat_log=cache-size

reset:
	sudo $(libzbc_bin)/reset_write_ptr_all.sh $(DEVICE)

plot:
	gnuplot cache_size.gp
	evince cache_size.eps &

replot:
	gnuplot cache_size.gp

clean:
	rm -rf *.log *.csv
