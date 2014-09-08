BCGES_short_courses
===================

Sequence data analysis short courses, slides and practicals
AM starts at 9:30
PM at 13:30
Each session lasts 3h.

Session 1, Monday September 8, PM: VP and Claudia Giambartolomei, Introduction session, fastq and BAM format, basic data parsing using R, command line scripting and Galaxy server.

Session 2, Tuesday AM: TC, Sequence mapping and visualization

Session 3, Tuesday PM: TC, Variant detection and calling

Session 4, Wednesday AM: VP and Warren Emmett, Multi-sample calling, variant annotation (Variant effect Predictor, ANNOVAR)

Session 5, Wednesday PM: VP and Kitty Lo, Picard tools, CNV calling using read depth analysis and unusual reads

Session 6, Thursday AM: TC, De novo assembly

Session 7, Thursday PM: VP and Nick Owen, RNA-Seq differential expression analysis

Session 8, Friday AM:  TC, Population genetics, application, summary


--------- Additional instructions
If you want to be able to compile the Rnw files you need to install 2 things:

- pdflatex is done by running
sudo apt-get install texlive

- package "knitr" in R, start R and run
install.packages("knitr")

then a "make" command in each session should run the code and update the pdf files.



---------

List of requirements:
- bwa 
- tophat
- GATK version > 3.1
- java version > 1.7
- samtools, ideally version > 1.0
- cufflinks

R packages:
- knitr
- DEseq
- DEXSeq
- Rsamtools
- ExomeDepth
- ShortRead