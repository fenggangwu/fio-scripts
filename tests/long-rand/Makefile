include ../parameters.mk
MYPID=$$$$

all:
	echo do nothing

zone8_w_cache:
	sudo zbc_reset_write_ptr $(DEVICE) -1
	sudo hdparm -W1 -Q31 $(DEVICE)
	./mktrace.py $(DEVICE) $(MID_OFFSET) 8 4096 524288
	sudo $(libzbc_bin)/record_finer2.sh nonseq_zone8_w_cache.csv \
		$(TIMER_RES) $(DEVICE) & \
	sudo fio write.fio --write_bw_log=zone8_w_cache \
		--write_lat_log=zone8_w_cache \
		--write_iops_log=zone8_w_cache; \
	trap "sudo kill $$!" EXIT


zone256_w_cache:
	sudo zbc_reset_write_ptr $(DEVICE) -1
	sudo hdparm -W1 -Q31 $(DEVICE)
	./mktrace.py $(DEVICE) $(MID_OFFSET) 256 4096 524288
	sudo $(libzbc_bin)/record_finer2.sh nonseq_zone256_w_cache.csv \
		$(TIMER_RES) $(DEVICE) & \
	sudo fio write.fio --write_bw_log=zone256_w_cache \
		--write_lat_log=zone256_w_cache \
		--write_iops_log=zone256_w_cache; \
	trap "sudo kill $$!" EXIT

zone8_wo_cache:
	sudo zbc_reset_write_ptr $(DEVICE) -1
	sudo hdparm -W0 -Q31 $(DEVICE)
	./mktrace.py $(DEVICE) $(MID_OFFSET) 8 4096 524288
	sudo $(libzbc_bin)/record_finer2.sh nonseq_zone8_wo_cache.csv \
		$(TIMER_RES) $(DEVICE) & \
	sudo fio write.fio --write_bw_log=zone8_wo_cache \
		--write_lat_log=zone8_wo_cache \
		--write_iops_log=zone8_wo_cache; \
	trap "sudo kill $$!" EXIT


zone256_wo_cache:
	sudo zbc_reset_write_ptr $(DEVICE) -1
	sudo hdparm -W0 -Q31 $(DEVICE)
	./mktrace.py $(DEVICE) $(MID_OFFSET) 256 4096 524288
	sudo $(libzbc_bin)/record_finer2.sh nonseq_zone256_wo_cache.csv \
		$(TIMER_RES) $(DEVICE) & \
	sudo fio write.fio --write_bw_log=zone256_wo_cache \
		--write_lat_log=zone256_wo_cache \
		--write_iops_log=zone256_wo_cache; \
	trap "sudo kill $$!" EXIT

plot:
	gnuplot long_rand_workingset.gp
	evince long_rand_workingset.eps &

replot:
	gnuplot long_rand_workingset.gp

clean:
	rm  -f  *.log *.csv *.eps *.job

stop_timer:
	sudo kill `ps -ef | grep -v grep |grep record_finer2.sh  | awk '{ print\
 $(2)}'`

