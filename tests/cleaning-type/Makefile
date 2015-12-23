include ../parameters.mk

all:
	sudo hdparm -a0 -A0 -W0 -Q1 $(DEVICE)

	sudo fio write.fio --filename=$(DEVICE) --offset=$(MID_OFFSET_4KOFF)
	sudo zbc_report_zones /dev/sdb | grep Imp
	sudo fio read.fio --filename=$(DEVICE) --offset=$(MID_OFFSET_4KOFF) \
		--write_lat_log=read-mid
	sleep 3
	sudo zbc_report_zones /dev/sdb | grep Imp
	sudo fio read.fio --filename=$(DEVICE) --offset=$(MID_OFFSET_4KOFF) \
		--write_lat_log=read-mid-delay

	gnuplot cleaning-type.gp
	evince cleaning_type.eps &

reset:
	sudo $(libzbc_bin)/reset_write_ptr_all.sh $(DEVICE)

plot:
	gnuplot cleaning-type.gp
	evince cleaning_type.eps &

replot:
	gnuplot cleaning-type.gp

clean:
	rm -rf *.log *.eps
