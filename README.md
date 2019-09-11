# Introduction to (NGS) Sequence QC

### Sept 11, 2019

An introduction to NGS sequencing, including an overview of methods, quality
control checks, preprocessing, and basic manipulation and mapping of the
data.

- Location: Building ??? Room A322
- Instructor: Poorani Subramanian - bioinformatics@niaid.nih.gov
- [bioinformatics @NIAID](https://bioinformatics.niaid.nih.gov/) - BCBB website has training materials, links to apps that we've written, and the services we provide.
- Email bioinformatics@niaid.nih.gov if you any questions about your particular sequence data or would like training in a specific topic.  

#### Resources
- [Lecture Notes](notes/sequence_qc_class.md) 
- [Locus info](notes/locus.md) - account, how to login and start interactive session, how to submit a job; how to transfer data, etc.
- [qc.sh](qc.sh) - script used in class; modified to add info for how to run the commands using your own Locus acct

#### Tools

- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- [MultiQC](https://multiqc.info/)
- [bowtie2](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
- [Geneious](https://support.geneious.com/hc/en-us) - [how to install](http://inside.niaid.nih.gov/topic/IT/support/software/Pages/geneious.aspx) (NIAID intranet)
- [bbduk](https://jgi.doe.gov/data-and-tools/bbtools/bb-tools-user-guide/bbduk-guide/) - BBDuk is also available in Geneious -> Tools -> Plugins -> BBDuk Trimmer
- [samtools](http://www.htslib.org/doc/samtools.html)
- [Nephele](https://nephele.niaid.nih.gov/) - easy web based interface to run FastQC, trim adapter/primer/quality, and merge paired-end reads. [QC Pipeline](https://nephele.niaid.nih.gov/user_guide_pipes/#qc_pipes) will work with general datasets (even non-microbiome).  [Very detailed info](https://nephele.niaid.nih.gov/details_qc/).

### Past Classes
- March 4, 2019 BCBB training - [4Mar2019 branch](https://github.com/niaid/NGS_Intro/tree/4Mar2019)

