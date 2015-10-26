#!/bin/bash

#usage ./tilt_shift.sh imagefile
#output blurred_imagefile

#fake-tilt-shift using a paraboloid blur
#technically not the same as tilt-shift, but looks close enough
#source: http://www.imagemagick.org/Usage/photos/#tilt_shift


#create parabaloid blur-map
#apply blur-map
#the number (here 15) sets the strength of the effect
convert $1 \
           \( +clone -sparse-color Barycentric '0,0 black 0,%h white' -function polynomial 4,-4,1 \)
           -compose Blur -set option:compose:args 15 -composite blurred_$1
