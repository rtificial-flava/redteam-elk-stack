#!/bin/bash

read -p 'input date: ' vardate
read -p 'input time: ' vartime
grep "$vartime" $vardate"_Dealer_schedule" | awk -F'\t' '{print $1, $3}'
