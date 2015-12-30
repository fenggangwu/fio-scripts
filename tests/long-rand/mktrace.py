#!/usr/bin/python

import argparse
import random
import sys
import math

sys.path.append('..')

from lib import gen_trace

parser = argparse.ArgumentParser()
parser.add_argument("device")
parser.add_argument("mid_offset", type=int)
parser.add_argument("nr_zones", type=int)
parser.add_argument("step", type=int)
parser.add_argument("nr_ops", type=int)
args = parser.parse_args()

zone_size = 256*1024*1024
samples = range(args.mid_offset - int(math.floor(args.nr_zones/2.0)) * zone_size, args.mid_offset + int(math.ceil(args.nr_zones/2.0))*zone_size - 1, args.step)



#random.shuffle(offsets)
#offsets = offsets[:args.nr_ops]

offsets=[random.choice(samples) for _ in xrange(args.nr_ops)]


gen_trace('write', args.device, offsets, args.step)
