#!/bin/bash
arg0=$(tr /a-z/ /A-Z/ <<< $1)
base=$(bc <<< "obase=10;ibase=16;$arg0")

unit=(B KB MB GB TB PB EB ZB YB BB)
values=()

quot=$base
rema=0
index=0

while [ $quot -ne 0 ] 
do
    temp=$(($quot/1024))
    rema=$(($quot%1024))
    quot=$temp
    values+=($rema) #array append
    index=$(($index+1))
done

plot=""
index=$((${#values[@]}-1))
while [ $index -ge 0 ]
do  
    temp=${values[$index]}${unit[$index]}
    plot=$plot" "$temp
    index=$(($index-1))
done

echo $plot
