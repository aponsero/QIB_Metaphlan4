#!/bin/bash -l

# load job configuration
IN_LIST="/hpc-home/zar24gir/1.Pipelines/7.Metaphlan4/list.txt"

#
#makes sure sample file is in the right place
#
if [[ ! -f "$IN_LIST" ]]; then
    echo "$IN_LIST does not exist. Please provide the path for a list of datasets to process. Job terminated."
    exit 1
fi

# get number of samples to process
export NUM_JOB=$(wc -l < "$IN_LIST")

# submit co_assemblies
echo "launching run_kneadata as an array job."

JOB_ID=`sbatch --job-name Mpa -a 1-$NUM_JOB run_metaphlan4.sh`
