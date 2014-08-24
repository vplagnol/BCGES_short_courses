export PATH=$PATH:/cluster/project4/vyp/vincent/Software/samtools-0.1.18/bcftools/:/cluster/project4/vyp/vincent/Software/samtools-0.1.18

fasta=data/chr21.fasta

samtools mpileup -uf $fasta -b data/GBR_bams.list | bcftools view -bvcg - > results/UBASH31A_samtools.bcf   
bcftools view results/UBASH31A_samtools.bcf  > results/UBASH31A_samtools.vcf