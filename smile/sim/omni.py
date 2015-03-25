#!/usr/bin/python

import sys
import math
from math import sin, cos

ALPHA    = (math.pi / 6)
POWER_S  = 80
POWER    = 100
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

sign = lambda x: math.copysign(1,x)

def calculate_available(ss, power_s):
	const = s_constants(POWER, ROTATION, ss)
	
	v = [0, 0, 0]
	v[0] = POWER * const[0]
	v[1] = POWER * const[1]
	v[2] = POWER * const[2]
	
	#print "v[0] / v[1]", v[0] / v[1]
	#print "v[1] / v[2]", v[1] / v[2]
	#print "v[0] / v[3]", v[0] / v[2]
	
	# Naskalujeme na maximum
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
	#print "\nv[0], v[1], v[2]", v
	
#	print "\nv[0], v[1], v[2]", v
#	print "v[0] / v[1]", v[0] / v[1]
#	print "v[1] / v[2]", v[1] / v[2]
#	print "v[0] / v[2]", v[0] / v[2]
#
#	# vyzkusime posunout o rezervu
#	L_1 = 1
#	L_2 = (v[1] / v[0]) * ((v[0] + sign(v[0])*power_s) / (v[1] + sign(v[1])*power_s))
#	L_3 = (v[2] / v[0]) * ((v[0] + sign(v[0])*power_s) / (v[2] + sign(v[2])*power_s))
#	
#	v[0] = (v[0] + sign(v[0])*power_s) * L_1
#	v[1] = (v[1] + sign(v[1])*power_s) * L_2
#	v[2] = (v[2] + sign(v[2])*power_s) * L_3
#
#
#	
#	print "\nv[0], v[1], v[2]", v
#	print "v[0] / v[1]", v[0] / v[1]
#	print "v[1] / v[2]", v[1] / v[2]
#	print "v[0] / v[2]", v[0] / v[2]
	return v

def check(ss, power, power_s):
	v = calculate_available(ss, POWER_S);
#	if((abs(v[0]) > power_s or v[0] == 0) and (abs(v[1]) > power_s or v[1] == 0) and (abs(v[2]) > power_s or v[2] == 0)):

def simulate():
	valid_x = []
	valid_y = []
	for x in range(0, 128):
		for y in range(0, 128):
			if((abs(v[0]) > POWER_S or v[0] == 0) and (abs(v[1]) > POWER_S or v[1] == 0) and (abs(v[2]) > POWER_S or v[2] == 0)):
				valid_x.append(x)
				valid_y.append(y)
	for i in range(0, len(valid_y) - 1):
		print str(valid_x[i]) +  "," + str(valid_y[i])

ss = [int(sys.argv[1]), int(sys.argv[2])]
v = calculate_available(ss, POWER_S);
print v


