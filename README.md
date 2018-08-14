# ENCODE_miRNA_pipeline

This pipeline is meant to process miRNA data obtained using the miRNA-seq protocol (v3.4):
https://www.encodeproject.org/documents/49f43842-5ab4-4aa1-a6f4-2b1234955d93/@@download/attachment/Multiplexed%20miRNA%20Sequencing%20Library%20Generation%20Protocol-3.4.pdf

In order for the pipeline to work properly, the underlying programs needs to be set up as described in src/Readme.txt.
Additionally, each of the scripts in the scripts directory defines the neccessary paths at the begining which need to be refined by the user befor running it.

In general the scripts should be run in the following order:
generate.star.index.sh will build the geneome directory in the refs, using the comprehensive annotation and the reference genome.
Then the cutadapt.sh will be use to trim the 3' and 5' adapters from the fastq file (note that the miRNA-seq protocol uses 7 different set of 5' adapters and the cutadapt script needs to be adjusted accordingly, you may find the sequences in refs/adapters)

finally, the star.sh script will run on the trim fastq and generate the counts, bam and wig files in the result directory.
