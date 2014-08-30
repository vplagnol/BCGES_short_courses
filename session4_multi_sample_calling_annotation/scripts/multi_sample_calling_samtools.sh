export PATH=$PATH:/cluster/project4/vyp/vincent/Software/samtools-0.1.18/bcftools/:/cluster/project4/vyp/vincent/Software/samtools-0.1.18


bcftools=/cluster/project8/vyp/vincent/Software/samtools-0.1.19/bcftools/bcftools
samtools=/cluster/project8/vyp/vincent/Software/samtools-0.1.19/samtools

fasta=../data/reference/chr21.fasta

if [ ! -e tmp ]; then mkdir tmp; fi
if [ ! -e results ]; then mkdir results; fi


#### first create a list file that contains all the relevant BAM files
### Note the .list suffix, which is important for GATK to know that this is a list of BAM files (and not a BAM file itself).
find ../data/BAM_files/ -name *bam > results/all_GBR_BAMs.list




$samtools mpileup -r 21:43823971-43867790 -Duf $fasta -b results/all_GBR_BAMs.list | $bcftools view -bvcg - > results/UBASH31A_samtools.bcf   
$bcftools view results/UBASH31A_samtools.bcf  > results/UBASH31A_samtools.vcf