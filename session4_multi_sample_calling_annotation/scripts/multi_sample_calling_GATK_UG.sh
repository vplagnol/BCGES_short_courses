if [ ! -e tmp ]; then mkdir tmp; fi
if [ ! -e results ]; then mkdir results; fi

### Below the path to the GATK executable. It will need to be updated 
#GATK=/usr/local/gatk/GenomeAnalysisTK.jar
GATK=/cluster/project8/vyp/vincent/Software/GenomeAnalysisTK-3.2-2/GenomeAnalysisTK.jar
fasta=../data/human_g1k_v37.fasta

#### first create a list file that contains all the relevant BAM files
### Note the .list suffix, which is important for GATK to know that this is a list of BAM files (and not a BAM file itself).
find ../data/BAM_files/ -name *bam > results/all_GBR_BAMs.list


java -Djava.io.tmpdir=tmp/ -Xmx4g -jar $GATK -T UnifiedGenotyper \
    -I results/all_GBR_BAMs.list \
    -R $fasta -o results/GATK_msamplecalling.vcf --annotation QualByDepth\
    --annotation HaplotypeScore --annotation MappingQualityRankSumTest --annotation ReadPosRankSumTest --annotation FisherStrand\
    --annotation RMSMappingQuality --annotation Coverage --genotype_likelihoods_model BOTH \
    --standard_min_confidence_threshold_for_calling 30.0 --standard_min_confidence_threshold_for_emitting 30.0 \
    --interval_padding 200 -L 21:43823971-43867790 -maxAltAlleles 4