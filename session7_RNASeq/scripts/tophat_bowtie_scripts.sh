tophatFolder=/cluster/project8/vyp/vincent/Software/tophat-2.0.8.Linux_x86_64
bowtie2Folder=/cluster/project8/vyp/vincent/Software/bowtie2-2.1.0
samtoolsFolder=/cluster/project8/vyp/vincent/Software/samtools-0.1.18
cufflinksFolder=/cluster/project8/vyp/vincent/Software/cufflinks-2.0.2.Linux_x86_64


export PATH=${bowtie2Folder}:${samtoolsFolder}:${tophatFolder}:${cufflinksFolder}:$PATH
export PYTHONPATH=/cluster/project4/vyp/vincent/libraries/python/share/apps/python-2.7.1/lib/python2.7/site-packages:/cluster/project4/vyp/vincent/libraries/python/lib/python:$PYTHONPATH


#### build index
bowtie2-build -f ../data/RNASeq/chr12_short.fa ../data/RNASeq/chr12_short

mkdir tophat_output tophat_output_no_gtf cufflinks_output results

f1=../data/RNASeq/reads_1.fq.gz
f2=../data/RNASeq/reads_2.fq.gz

tophat --no-coverage-search -o tophat_output -r 220 --library-type fr-unstranded --segment-length 30 -G ../data/RNASeq/chr12_short.gtf ../data/RNASeq/chr12_short ${f1} ${f2}
cufflinks  -o cufflinks_output --GTF ../data/RNASeq/chr12_short.gtf tophat_output/accepted_hits.bam

####extract introns
samtools index tophat_output/accepted_hits.bam
samtools view  tophat_output/accepted_hits.bam 12:2055213-2113677 | awk '{if ($6 ~ /N/ ) {print;}}' | ./scripts/get_introns.pl | awk '{print $4"_"$5}'| sort | uniq -c > results/DCP1B.tab


##### now without the GTF
tophat --no-coverage-search -o tophat_output_no_gtf -r 220 --library-type fr-unstranded --segment-length 30 ../data/RNASeq/chr12_short ${f1} ${f2}
samtools index tophat_output_no_gtf/accepted_hits.bam
samtools view  tophat_output_no_gtf/accepted_hits.bam 12:2055213-2113677 | awk '{if ($6 ~ /N/ ) {print;}}' | ./scripts/get_introns.pl | awk '{print $4"_"$5}'| sort | uniq -c > results/DCP1B_no_gtf.tab