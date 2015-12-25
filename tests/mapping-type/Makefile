include ../parameters.mk

all:
	sudo hdparm -a0 -A0 -W0 -Q1 $(DEVICE)

	./mktrace.py $(DEVICE) $(BAND_A_OFFSET) $(BAND_B_OFFSET) \
		$(TRACK_SIZE) $(BLOCK_SIZE)

	sudo fio write.fio --filename=$(DEVICE) --offset=$(BAND_A_OFFSET) --size=$(TRACK_SIZE)
	sudo fio write.fio --filename=$(DEVICE) --offset=$(BAND_B_OFFSET) --size=$(DOUBLE_TRACK_SIZE)

	sudo fio replay.fio --write_lat_log=before
	sudo fio write-rand.fio --filename=$(DEVICE)
	sudo fio replay.fio --write_lat_log=mid
	sleep 5
	sudo fio replay.fio --write_lat_log=after
	gnuplot mapping-type.gp
	evince mapping-type.eps &

plot:
	gnuplot mapping-type.gp
	evince mapping-type.eps &

replot:
	gnuplot mapping-type.gp


reset:
	sudo $(libzbc_bin)/reset_write_ptr_all.sh $(DEVICE)

clean:
	rm -rf *.log *.eps
