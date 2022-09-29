#!/bin/bash

# Set colon as delimiter
IFS=':'
inputArray=(${1})

hour=${inputArray[0]}
minute=${inputArray[1]}

echo "Source time is ${hour}:${minute}"

minuteDegree=$((360/60)) # each minute is 6 degrees
hourDegree=$((360/12)) # each hour is 30 degrees

# Calculate minute and hour angles
minuteAngle=$((${minute}*minuteDegree))
hourAngle=$((${hour}*hourDegree+hourDegree*minuteAngle/360))

angle1=$((minuteAngle-hourAngle))
angle1=$((${angle1#-}%360))  # take absolute value of minute angle
angle2=$((360-angle1))

echo "Angle1=${angle1}  Angle2=${angle2}"
