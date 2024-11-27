#!/bin/bash -l
#SBATCH --job-name=metaphlan
#SBATCH --output=errout/outputr%j.txt
#SBATCH --error=errout/errors_%j.txt
#SBATCH --partition=
#SBATCH --time=12:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=5
#SBATCH --mem-per-cpu=32G


# load job configuration
source package edb34606-aeeb-41c2-890b-079c2ef1fd1c
DB_DIR=""
IN_DIR=""
IN_LIST="${PWD}/list.txt"

# echo for log
echo "job started"; hostname; date

cd $IN_DIR
export f=`head -n +${SLURM_ARRAY_TASK_ID} $IN_LIST | tail -n 1`

OUT_FILE="$IN_DIR/uncl_mpa23_$f"
metaphlan $IN_DIR/${f} --input_type fastq --bowtie2db $DB_DIR --offline --unclassified_estimation > $OUT_FILE

#OUT_FILE="$IN_DIR/mpa23_$f"
#metaphlan $IN_DIR/${f} --input_type fastq --bowtie2db $DB_DIR --offline > $OUT_FILE

