BCGES_short_courses
===================

Sequence data analysis short courses, slides and practicals
AM starts at 9:30
PM at 13:30
Each session lasts 3h.

Session 1, Monday September 8, AM: Vincent Plagnol and Niko Pontikos, introduction to command line, FASTQ format, Galaxy

Session 2, Monday PM: Stephane Hue, Sequence mapping and visualization

Session 3, Tuesday AM: Stephane Hue, Variant detection and calling

Session 4, Tuesday PM: Vincent Plagnol and Warren Emmett

Session 5, Wednesday AM: Vincent Plagnol and Chris Steele, Picard tools, CNV calling using read depth analysis and unusual reads

Session 6, Wednesday PM: Stephane Hue, De novo assembly

Session 7, Thursday AM: Vincent Plagnol, Jack Humphrey, introduction to RNA-Sequencing

Session 8, Thursday PM:  Stephane Hue, Population genetics, application, summary


--------- Additional instructions
If you want to be able to compile the Rnw files you need to install 2 things:

- pdflatex is done by running
sudo apt-get install texlive

- package "knitr" in R, start R and run
install.packages("knitr")

then a "make" command in each session should run the code and update the pdf files.



---------

List of requirements:
- R version > 3.1
- bwa 
- tophat
- GATK version > 3.1
- java version > 1.7
- samtools, ideally version > 1.0
- cufflinks
- IGV
- vcftools
- picard tools
- bedtools
- pdflatex

R packages:
- knitr
- DEseq
- DEXSeq
- Rsamtools
- ExomeDepth
- ShortRead