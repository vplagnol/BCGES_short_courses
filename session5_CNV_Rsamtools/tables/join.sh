awk '{split ($4,a,"_"); {print $1"\t"$2"\t"$3"\t"a[1]"\t"a[3]"\t"$6}}' UCSC_exons.bed > UCSC_exons_modif.bed

sort -k4 UCSC_exons_modif.bed > temp1
sort -k4 UCSC_canonical.bed > temp2

join -1 4 -2 4  temp1  temp2 | awk '{print $2"\t"$3"\t"$4"\t"$10"\t"$5"\t"$6}' | bedtools sort -i "-" | sed -e 's/^chr//g' > UCSC_exons_modif_canonical.bed

grep UBASH3A UCSC_exons_modif_canonical.bed  > UBASH3A.bed
