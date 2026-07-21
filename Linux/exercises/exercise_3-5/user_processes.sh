#!/bin/bash

echo "How do you like to sort?"
echo "1) Memory (%MEM)"
echo "2) CPU (%CPU)"
read -p "Enter choice 1 or 2: " choice


read -p "How many processes do you like to display: " process_count
echo "Running user processes for user: $USER"
echo "=================================="

if [ "$choice" -eq 1 ]; then 
	echo "Sorting by memory consumption (%MEM):"
	ps aux | grep "^$USER" | sort -k4 -nr | head -n "$process_count"
elif [ "$choice" -eq 2 ]; then
	echo "Sorting by CPU Utilization (%CPU):"
	ps aux | grep "^$USER" | sort -k3 -nr | head -n "$process_count"
else
	echo "Invalid selection. Exiting script."
	exit 1
fi	
