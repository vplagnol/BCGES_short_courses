chmod u+x ./scripts/get_introns.pl

#### build index
bowtie2-build -f ../data/RNASeq/chr12_short.fa ../data/RNASeq/chr12_short

mkdir results/tophat_output_with_gtf results/tophat_output_no_gtf results/cufflinks_output

f1=../data/RNASeq/reads_1.fq.gz
f2=../data/RNASeq/reads_2.fq.gz

tophat --no-coverage-search -o results/tophat_output_with_gtf -r 220 --library-type fr-unstranded --segment-length 30 -G ../data/RNASeq/chr12_short.gtf ../data/RNASeq/chr12_short ${f1} ${f2}
cufflinks  -o results/cufflinks_output --GTF ../data/RNASeq/chr12_short.gtf results/tophat_output/accepted_hits.bam

####extract introns
samtools index tophat_output_with_gtf/accepted_hits.bam
samtools view  tophat_output_with_gtf/accepted_hits.bam 12:2055213-2113677 | awk '{if ($6 ~ /N/ ) {print;}}' | ./scripts/get_introns.pl | awk '{print $4"_"$5}'| sort | uniq -c > results/DCP1B.tab


##### now without the GTF
tophat --no-coverage-search -o results/tophat_output_no_gtf -r 220 --library-type fr-unstranded --segment-length 30 ../data/RNASeq/chr12_short ${f1} ${f2}
samtools index results/tophat_output_no_gtf/accepted_hits.bam
samtools view  results/tophat_output_no_gtf/accepted_hits.bam 12:2055213-2113677 | awk '{if ($6 ~ /N/ ) {print;}}' | ./scripts/get_introns.pl | awk '{print $4"_"$5}'| sort | uniq -c > results/DCP1B_no_gtf.tab