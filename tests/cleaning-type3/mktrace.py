#!/usr/bin/python

import argparse
import random
import sys

sys.path.append('..')

from lib import gen_trace

parser = argparse.ArgumentParser()
parser.add_argument("device", nargs='?', default='/dev/sdb')

args = parser.parse_args()

offset = 64*256*1024*1024 + 128*1024*1024
size = 200*256*1024*1024
step = 256*1024*1024# + 128*1024*1024

offsets = range(offset, offset + size, step)

offset = 64*256*1024*1024 + 64*1024*1024
size = 200*256*1024*1024
step = 256*1024*1024# + 128*1024*1024

offsets += range(offset, offset + size, step)

#random.shuffle(offsets)
gen_trace('write', args.device, offsets)
gen_trace('read', args.device, offsets)
