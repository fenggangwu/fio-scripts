include ../parameters.mk

all:
	sudo hdparm -a256 -A1 -W0 -Q1 $(DEVICE)
	sudo fio write.fio --filename=$(DEVICE)
	sudo fio read.fio --filename=$(DEVICE)
	gnuplot zone-profile.gp
	evince zone-profile.eps

write:
	sudo hdparm -a0 -A0 -W0 -Q1 $(DEVICE)
	sudo $(libzbc_bin)/record_finer2.sh nonseq.csv 60 $(DEVICE) &
	sudo fio write.fio --filename=$(DEVICE) \
		 --offset=$(LOW_OFFSET_LAST_BLK)

record:
	sudo $(libzbc_bin)/record_finer2.sh nonseq.csv 1 $(DEVICE)

reset:
	sudo $(libzbc_bin)/reset_write_ptr_all.sh  $(DEVICE)

clean:
	rm -rf *.log *.eps
