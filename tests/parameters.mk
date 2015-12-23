DEVICE = /dev/sdb
libzbc_bin = /home/fwu/libzbc/bench_fwu

# Offsets used by several tests.
LOW_OFFSET=17179869184 # start byte of the 64-th zone
LOW_OFFSET_4KOFF=17179873280 # 4KB offset of the 64-th zone
MID_OFFSET=4000762036224 #start byte of the 14904-th zone
MID_OFFSET_4KOFF=4000762040320 # 4KB offset of the 14904-th zone
HIGH_OFFSET=8001255636992 # start byte of 29808-th zone
HIGH_OFFSET_4KOFF=8001255641088 # 4KB offset of the 29808-th zone

# Band size estimate and accuracy used by band size detection test.
ESTIMATE=52428800
ACCURACY=1048576

# Parameters used by the mapping type test.
BAND_A_OFFSET=0
BAND_B_OFFSET=52428800
TRACK_SIZE=2097152
BLOCK_SIZE=16384
