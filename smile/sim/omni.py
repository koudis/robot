#!/usr/bin/python

import sys
import math
from math import sin, cos

ALPHA    = (math.pi / 6)
POWER    = 32
ROTATION = 0


def s_constants(v, S, s):
	a = (sin(ALPHA)/(v*(1 + sin(ALPHA))))*(S - v*s[0]) - s[0]
	b = (s[1]/(2*cos(ALPHA))) + (1 / (2*v*(1 + sin(ALPHA)))) * (S - v*s[0])
	c = -(s[1]/(2*cos(ALPHA))) + (1 / (2*v*(1 + sin(ALPHA)))) * (S - v*s[0])
	return [a, b, c]

def get_v1(v1):
	return [-v1, 0]

def get_v2(v2):
	return [v2*sin(ALPHA), v2*cos(ALPHA)]

def get_v3(v3):
	return [v3*sin(ALPHA), -v3*cos(ALPHA)]

ss = [float(sys.argv[1]), float(sys.argv[2])]
const = s_constants(POWER, ROTATION, ss)

v1 = get_v1(POWER * const[0])
v2 = get_v2(POWER * const[1])
v3 = get_v3(POWER * const[2])

sum = [ v1[0] + v2[0] + v3[0], v1[1] + v2[1] + v3[1] ]

print "s_x / s_y = ", ss[0] / ss[1]
print "sum_x / sum_y = ", sum[0] / sum[1]
print "sum[0:2]", sum[0:2]
print "consts[0:3]", const[0:3]
print "v1, v2, v3 ", v1, v2, v3
