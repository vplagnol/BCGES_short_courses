if [ ! -e tmp ]; then mkdir tmp; fi
if [ ! -e results ]; then mkdir results; fi

### Below the path to the GATK executable. It will need to be updated 
#GATK=/usr/local/gatk/GenomeAnalysisTK.jar
GATK=/cluster/project8/vyp/vincent/Software/GenomeAnalysisTK-3.2-2/GenomeAnalysisTK.jar
fasta=../data/human_g1k_v37.fasta


#### first create a list file that contains all the relevant BAM files
### Note the .list suffix, which is important for GATK to know that this is a list of BAM files (and not a BAM file itself).


for BAM in `find ../data/BAM_files/ -name *bam`; do
    echo $BAM
    code=`basename $BAM .bam`

    java -Djava.io.tmpdir=tmp/ -Xmx4g -jar $GATK -T HaplotypeCaller \
	-I $BAM \
	-R $fasta -o results/${code}.gvcf \
	--emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 \
	-stand_call_conf 30.0 \
	-stand_emit_conf 10.0 \
	--GVCFGQBands 10 --GVCFGQBands 20 --GVCFGQBands 60 \
	--interval_padding 200 -L 21:43823971-43867790 -maxAltAlleles 4

done