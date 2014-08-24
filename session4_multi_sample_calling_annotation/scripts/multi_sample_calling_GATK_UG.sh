

#### first create a list file that contains all the relevant BAM files
### Note the .list suffix, which is important for GATK to know that this is a list of BAM files (and not a BAM file itself).
find ../../data/BAM_files/ -name *bam > all_GBR_BAMs.list

if [ ! -e tmp ]; then mkdir tmp; fi
if [ ! -e results ]; then mkdir results; fi

### Below the path to the GATK executable. It will need to be updated 
GATK=/cluster/project8/vyp/vincent/Software/GenomeAnalysisTK-3.2-2/GenomeAnalysisTK.jar
fasta=/cluster/project8/vyp/vincent/data/reference_genomes/fasta/human_g1k_v37.fasta

#export PATH=$PATH:/cluster/project4/vyp/vincent/Software/samtools-0.1.18/bcftools/:/cluster/project4/vyp/vincent/Software/samtools-0.1.18

#samtools faidx data/chr21.fasta
#java -jar /cluster/project4/vyp/vincent/Software/picard-tools-1.75/CreateSequenceDictionary.jar R=$fasta O=data/chr21.dict

/share/apps/jdk1.7.0_25/jre/bin/java -Djava.io.tmpdir=tmp/ -Xmx4g -jar $GATK -T UnifiedGenotyper \
    -I all_GBR_BAMs.list \
    -R $fasta -o results/GATK_msamplecalling.vcf --annotation QualByDepth\
    --annotation HaplotypeScore --annotation MappingQualityRankSumTest --annotation ReadPosRankSumTest --annotation FisherStrand\
    --annotation RMSMappingQuality --annotation Coverage --genotype_likelihoods_model BOTH \
    --standard_min_confidence_threshold_for_calling 30.0 --standard_min_confidence_threshold_for_emitting 30.0 \
    --interval_padding 200 -L 21:43823971-43867790 -maxAltAlleles 4