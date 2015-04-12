#!/usr/bin/python
from __future__ import division

import sys
import math
from math import sin, cos

ALPHA    = (math.pi / 6)
POWER    = 75
ROTATION = 0


def s_constants(v, S, s):
	a = (0.3333 / v)*(S - v * s[0]) - s[0]
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

#print "s_x / s_y = ", ss[0] / ss[1]
#print "sum_x / sum_y = ", sum[0] / sum[1]
print "sum[0:2]", sum[0:2]
print "consts[0:3]", const[0:3]
print "v1, v2, v3 ", v1, v2, v3



v = [0, 0, 0]
v[0] = POWER * const[0]
v[1] = POWER * const[1]
v[2] = POWER * const[2]

v_max = 0
for i in range(0, 2):
	if(v_max < abs(v[i])):
		v_max = abs(v[i])

if(v[0] == 0):
	v[0] = 0
else:
	v[0] = ( v[0] / v_max ) * POWER

if(v[1] == 0):
	v[1] = 0
else:
	v[1] = ( v[1] / v_max ) * POWER

if(v[2] == 0):
	v[2] = 0
else:
	v[2] = ( v[2] / v_max ) * POWER




sum = [ v1[0] + v2[0] + v3[0], v1[1] + v2[1] + v3[1] ]

#print "s_x / s_y = ", ss[0] / ss[1]
#print "sum_x / sum_y = ", sum[0] / sum[1]
print "sum[0:2]", sum[0:2]
print "consts[0:3]", const[0:3]
print "v1, v2, v3 ", v1, v2, v3

print "\n"
print v

