include ../parameters.mk

all:
	sudo hdparm -a0 -A0 -W0 -Q1 $(DEVICE)
	./mktrace.py $(DEVICE)
	sudo fio write.fio
	gnuplot drive-type.gp
	evince drive-type.eps &
	sudo $(libzbc_bin)/reset_write_ptr_all.sh $(DEVICE)

clean:
	rm -rf *.eps *.log
