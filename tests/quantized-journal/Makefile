include ../parameters.mk

all:
	sudo hdparm -a0 -A0 -W0 -Q16 $(DEVICE)
	./mktrace.py $(DEVICE)
	sudo fio write.fio --write_lat_log=rand-write-134K
	gnuplot quantized.gp
#	evince drive-type.eps &
	sudo $(libzbc_bin)/reset_write_ptr_all.sh $(DEVICE)

clean:
	rm -rf *.eps *.log
