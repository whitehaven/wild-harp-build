#!/bin/bash

grep -v -f excluded_params.txt ardupilot_wild_harp.param > temp.param
rm ardupilot_wild_harp.param
mv temp.param ardupilot_wild_harp.param
