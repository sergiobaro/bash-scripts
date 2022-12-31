#!/bin/bash

dad_years_old=$1
son_years_old=$2

(( result = $dad_years_old - $son_years_old * 2 ))

echo ${result#-} # absolute value