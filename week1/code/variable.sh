#!/bin/sh
#Author: Amy Feakes amy.feakes222@imperial.ac.uk
#Script: variable.sh
#Desc: illustrates the use of variables 
#Arguments: none
#Date: Oct 2022

# Special variables

echo "This script was called with $# parameters"
echo "The script's name is $0"
echo "The arguments are $@"
echo "The first argument is $1"
echo "The second argument is $2"

# Assigned Variables; Explicit declaration:
MY_VAR='some string'
echo 'the current value of the variable is:' $MY_VAR 
echo
echo 'Please enter a new string'
read MY_VAR
echo
echo 'the current value of the variable is:' $MY_VAR
echo

## Assigned Variables; Reading (multiple values) from user input: 
echo 'Enter two numbers separated by space(s)'
read a b 
echo 
echo 'you entered' $a 'and' $b '; Their sum is:'

## Assigned Variables; Command subsitution 
MY_SUM=$(expr $a + $b)
echo $MY_SUM
