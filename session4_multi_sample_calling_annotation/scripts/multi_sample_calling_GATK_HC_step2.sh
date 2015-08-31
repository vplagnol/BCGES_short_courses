if [ ! -e tmp ]; then mkdir tmp; fi
if [ ! -e results ]; then mkdir results; fi

### Below the path to the GATK executable. It will need to be updated 
GATK=/usr/local/gatk/GenomeAnalysisTK.jar
##GATK=/cluster/project8/vyp/vincent/Software/GenomeAnalysisTK-3.2-2/GenomeAnalysisTK.jar
fasta=human_g1k_v37.fasta


#### first create a list file that contains all the relevant BAM files
### Note the .list suffix, which is important for GATK to know that this is a list of BAM files (and not a BAM file itself).
find results/ -name *gvcf > results/gVCF_list.list

java -Djava.io.tmpdir=tmp/ -Xmx4g -jar $GATK -T GenotypeGVCFs \
	-R $fasta \
        --variant results/gVCF_list.list \
	--interval_padding 200 -L 21:43823971-43867790 -maxAltAlleles 4 \
        -o results/GATK_msamplecalling_HC.vcf

