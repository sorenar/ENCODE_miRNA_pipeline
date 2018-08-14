#! /bin/bash
#$ -N star.log
#$ -pe openmp 16
#$ -q sam,bio
#$ -ckpt blcr
#$ -l kernel=blcr
#$ -r y
#$ -l virtual_free=48G

export PATH=$PATH:/share/samdata/sorenar/miRNA/pipeline/src/
genomedir="/share/samdata/sorenar/miRNA/pipeline/refs/GRCh38/"
annotation="/share/samdata/sorenar/miRNA/pipeline/refs/gencode.v24.annotation.gtf"
refgenome="/share/samdata/sorenar/miRNA/pipeline/refs/GRCh38_no_alt_analysis_set_GCA_000001405.15.fasta"

STAR \
	--runThreadN 16 \
	--runMode genomeGenerate \
	--genomeDir $genomedir  \
	--sjdbGTFfile $annotation \
	--sjdbOverhang 1 \
	--genomeFastaFiles $refgenome
