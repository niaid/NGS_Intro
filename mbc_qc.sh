#!/usr/bin/env bash

## Class datasets can be copied to your own directory on Locus:
cp -r /hpcdata/scratch/mbc .




#### QC #####
module load fastqc
module load multiqc

#### FastQC
mkdir fastqc_output

## fastqc help
fastqc -h

## run fastqc
fastqc *_R*.fastq.gz -o ./fastqc_output
cd ./fastqc_output

## run multiqc to generate summary report
## useful parameter to add is --cl-config "read_count_multiplier: 1"
## this will give the total number of reads in each file instead of giving the count in millions
multiqc .


#### Trimming
module load bbmap

## Move back up a directory
cd ..

## BBDuk help https://jgi.doe.gov/data-and-tools/bbtools/bb-tools-user-guide/bbduk-guide/
bbduk.sh -h


## adapter trimming on the right
bbduk.sh in=401A-D1_S1_L001_R1_001.fastq.gz in2=401A-D1_S1_L001_R2_001.fastq.gz out=401A-D1_R1_trim.fastq out2=401A-D1_R2_trim.fastq ktrim=r k=27 mink=4 hdist=1 ref=$EBROOTBBMAP/resources/adapters.fa minlen=10 overwrite=t threads=10


## quality - can do at the same time as adapter, just did this separately for clarity
bbduk.sh in=401A-D1_R1_trim.fastq in2=401A-D1_R2_trim.fastq out=401A-D1_R1_trim.quality.fastq out2=401A-D1_R2_trim.quality.fastq qtrim=rl trimq=15 maq=2 minlen=60 overwrite=t threads=10

## merge reads with flash https://ccb.jhu.edu/software/FLASH/
module load flash
flash --help

## Merge trimmed reads
# flash -m min_overlap --max-overlap max_overlap -t numberofthreads --max-mismatch-density max_mismatch_density -o SampleID_merged -d ./outputs/merged R1.fastq R2.fastq
flash -m 10 --max-overlap 300 -t 10 --max-mismatch-density 0.25 -o 401A-D1_merged -d . 401A-D1_R1_trim.quality.fastq 401A-D1_R2_trim.quality.fastq


#### Mapping ######
module load bowtie2

## See the bowtie2 help http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml
bowtie2 --help

## build phiX bowtie2 index
bowtie2-build ./Enterobacteria_phage_phiX174_sensu_lato.fasta phiX

## inspect bowtie2 index
bowtie2-inspect -s phiX

## map against phiX
## we use --very-fast in class, but probably better to omit this parameter or use --very-sensitive
## there is trade-off between speed and sensitivity
bowtie2 -k 1 -p 10 --very-fast -t -x phiX -1 Undetermined_S0_L001_R1_001.fastq.gz -2 Undetermined_S0_L001_R2_001.fastq.gz -S Undetermined_phiX.bowtie2.sam --no-unal --un-conc Undetermined_unmapped.fastq 2>&1 | tee Undetermined_phiX.bowtie2.log



### Unload modules
module purge
module load uge

#### Samtools
module load samtools

## samtools sort
samtools sort Undetermined_phiX.bowtie2.sam -o Undetermined_phiX.bowtie2.sam
