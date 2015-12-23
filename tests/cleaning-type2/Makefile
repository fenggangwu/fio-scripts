include ../parameters.mk

all:
	sudo hdparm -a0 -A0 -W0 -Q1 $(DEVICE)

	sudo fio write.fio --filename=$(DEVICE)
	sudo zbc_report_zones /dev/sdb | grep "non_seq 1" | wc -l

	sudo fio read.fio --filename=$(DEVICE) \
		--write_lat_log=read-mid
	sleep 500
	sudo zbc_report_zones /dev/sdb | grep "non_seq 1" | wc -l
	sudo fio read.fio --filename=$(DEVICE) \
		--write_lat_log=read-mid-delay500


	sleep 500
	sudo zbc_report_zones /dev/sdb | grep "non_seq 1" | wc -l
	sudo fio read.fio --filename=$(DEVICE) \
		--write_lat_log=read-mid-delay1000


	sleep 500
	sudo zbc_report_zones /dev/sdb | grep "non_seq 1" | wc -l
	sudo fio read.fio --filename=$(DEVICE) \
		--write_lat_log=read-mid-delay1500


	sleep 500
	sudo zbc_report_zones /dev/sdb | grep "non_seq 1" | wc -l
	sudo fio read.fio --filename=$(DEVICE) \
		--write_lat_log=read-mid-delay2000

	sleep 500
	sudo zbc_report_zones /dev/sdb | grep "non_seq 1" | wc -l
	sudo fio read.fio --filename=$(DEVICE) \
		--write_lat_log=read-mid-delay2500




	gnuplot cleaning-type2.gp
	evince cleaning_type2.eps &

reset:
	sudo $(libzbc_bin)/reset_write_ptr_all.sh $(DEVICE)

plot:
	gnuplot cleaning-type2.gp
	evince cleaning_type2.eps &

replot:
	gnuplot cleaning-type2.gp

clean:
	rm -rf *.log *.eps
