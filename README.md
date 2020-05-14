# Introduction to (NGS) Sequence QC

### May 14, 2020

An introduction to using Locus while running some basic QC.

- Instructor: Poorani Subramanian - bioinformatics@niaid.nih.gov
- [Locus info](notes/locus.md) - account, how to login and start interactive session, how to submit a job; how to transfer data, etc.

- [Lecture Notes](notes/sequence_qc_class.md) 
- [qc.sh](qc.sh) - script used in class with some extra commands
- [sequence data](https://proj-bip-prod-publicread.s3.amazonaws.com/training/NGS_Intro/lpd_data.zip)

#### Tools

- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- [MultiQC](https://multiqc.info/)
- [bowtie2](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
- [Geneious](https://support.geneious.com/hc/en-us) - [how to install](http://inside.niaid.nih.gov/topic/IT/support/software/Pages/geneious.aspx) (NIAID intranet)
- [bbduk](https://jgi.doe.gov/data-and-tools/bbtools/bb-tools-user-guide/bbduk-guide/) - BBDuk is also available in Geneious -> Tools -> Plugins -> BBDuk Trimmer
- [samtools](http://www.htslib.org/doc/samtools.html)
- [Nephele](https://nephele.niaid.nih.gov/) - easy web based interface to run FastQC, trim adapter/primer/quality, and merge paired-end reads. [QC Pipeline](https://nephele.niaid.nih.gov/user_guide_pipes/#qc_pipes) will work with general datasets (even non-microbiome).  [Very detailed info](https://nephele.niaid.nih.gov/details_qc/).

### Past Classes
- Sept 11, 2019 RML training - [RML-2019](https://github.com/niaid/NGS_Intro/tree/RML-2019)
- March 4, 2019 BCBB training - [4Mar2019 branch](https://github.com/niaid/NGS_Intro/tree/4Mar2019)
- Aug 29, 2018 ACE Uganda training [uganda-2018](https://github.com/niaid/NGS_Intro/tree/uganda-2018)

