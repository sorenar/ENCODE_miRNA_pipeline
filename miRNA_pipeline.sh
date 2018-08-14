#! /bin/bash
#$ -N STAR_qsub
#$ -q sam128,sam,bio,abio,bigmemory
#$ -pe openmp 8

slid=$1

mkdir refs/GRCh38

chmod -R gu+wr refs/GRCh38

mkdir "results/"$slid

chmod -R gu+wr "results/"$slid

./scripts/generate.star.index.sh

./scripts/cutadapt.sh "fastq/"$slid".fastq" $slid

./scripts/star.sh $slid
