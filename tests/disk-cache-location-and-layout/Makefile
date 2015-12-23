include ../parameters.mk

all:
	sudo hdparm -a0 -A0 -W0 -Q1 $(DEVICE)

	sudo fio read.fio --filename=$(DEVICE) --offset=$(LOW_OFFSET) \
		--write_lat_log=read-low-empty
	sudo fio write-seq.fio --filename=$(DEVICE) --offset=$(LOW_OFFSET)
	sudo fio read.fio --filename=$(DEVICE) --offset=$(LOW_OFFSET) \
		--write_lat_log=read-low-seq
	sudo fio write-skip.fio --filename=$(DEVICE) \
		--offset=$(LOW_OFFSET_4KOFF)
	sudo fio read.fio --filename=$(DEVICE) --offset=$(LOW_OFFSET) \
		--write_lat_log=read-low-skip
	sudo fio write-seq.fio --filename=$(DEVICE) \
		--offset=$(LOW_OFFSET)
	sudo fio read.fio --filename=$(DEVICE) --offset=$(LOW_OFFSET) \
		--write_lat_log=read-low-nonseq



	sudo fio read.fio --filename=$(DEVICE) --offset=$(MID_OFFSET) \
		--write_lat_log=read-mid-empty
	sudo fio write-seq.fio --filename=$(DEVICE) --offset=$(MID_OFFSET)
	sudo fio read.fio --filename=$(DEVICE) --offset=$(MID_OFFSET) \
		--write_lat_log=read-mid-seq
	sudo fio write-skip.fio --filename=$(DEVICE) \
		--offset=$(MID_OFFSET_4KOFF)
	sudo fio read.fio --filename=$(DEVICE) --offset=$(MID_OFFSET) \
		--write_lat_log=read-mid-skip
	sudo fio write-seq.fio --filename=$(DEVICE) \
		--offset=$(MID_OFFSET)
	sudo fio read.fio --filename=$(DEVICE) --offset=$(MID_OFFSET) \
		--write_lat_log=read-mid-nonseq


	sudo fio read.fio --filename=$(DEVICE) --offset=$(HIGH_OFFSET) \
		--write_lat_log=read-high-empty
	sudo fio write-seq.fio --filename=$(DEVICE) --offset=$(HIGH_OFFSET)
	sudo fio read.fio --filename=$(DEVICE) --offset=$(HIGH_OFFSET) \
		--write_lat_log=read-high-seq
	sudo fio write-skip.fio --filename=$(DEVICE) \
		--offset=$(HIGH_OFFSET_4KOFF)
	sudo fio read.fio --filename=$(DEVICE) --offset=$(HIGH_OFFSET) \
		--write_lat_log=read-high-skip
	sudo fio write-seq.fio --filename=$(DEVICE) \
		--offset=$(HIGH_OFFSET)
	sudo fio read.fio --filename=$(DEVICE) --offset=$(HIGH_OFFSET) \
		--write_lat_log=read-high-nonseq


	gnuplot cache_loc_empty.gp
	gnuplot cache_loc_seq.gp
	gnuplot cache_loc_skip.gp
	gnuplot cache_loc_nonseq.gp
	evince cache_loc_empty.eps &
	evince cache_loc_seq.eps &
	evince cache_loc_skip.eps &
	evince cache_loc_nonseq.eps &

reset:
	sudo $(libzbc_bin)/reset_write_ptr_all.sh $(DEVICE)

plot:
	gnuplot cache_loc_empty.gp
	gnuplot cache_loc_seq.gp
	gnuplot cache_loc_skip.gp
	gnuplot cache_loc_nonseq.gp
	evince cache_loc_empty.eps &
	evince cache_loc_seq.eps &
	evince cache_loc_skip.eps &
	evince cache_loc_nonseq.eps &

replot:
	gnuplot cache_loc_empty.gp
	gnuplot cache_loc_seq.gp
	gnuplot cache_loc_skip.gp
	gnuplot cache_loc_nonseq.gp


clean:
	rm -rf *.log *.eps

