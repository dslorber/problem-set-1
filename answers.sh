#! /usr/bin/env bash 

datasets='/Users/lorberbd/data-sets/'


# Which state in states.tab.gz has the lowest murder rate? 

states="$datasets/misc/states.tab.gz"

answer_1=$(gzcat $states \
    | grep -v '^#' \
    | cut -f1,6 \
    | sort -k2g \
    | head -n1 \
    | cut -f1 \
    | sed 's/"//g') 

echo "answer-1: $answer_1"

#How many sequence records are in the sample.fa file? 

sample="$datasets/fasta/sample.fa"
answer_2=$(grep '^>' $sample | wc -l)
echo "answer-2: $answer_2"


#How many unique CpG IDs are in cpg.bed.gz?

cpgs="$datasets/bed/cpg.bed.gz"
answer_3=$(gzcat $cpgs | cut -f4 | sort | uniq | wc -l)
echo "answer-3: $answer_3"

#How many sequence records are in the SP1.fq file?

records="$datasets/fastq/SP1.fq"
answer_4=$(cat $records | grep "@cluster" | wc -l)
echo "answer-4: $answer_4"

#How many words are on lines containing the word bloody in hamlet.txt?

words="$datasets/misc/hamlet.txt"
answer_5=$(grep -i "bloody" $words | wc -w)
echo "answer-5: $answer_5"

#What is the length of the sequence in the first record of sample.fa?

length="$datasets/fasta/sample.fa"
answer_6=$(cat $length \
    | grep -v '>' \
    | head -n1 \
    | awk '{ print length($0); }')
echo "answer-6: $answer_6"


#What is the name of the longest gene in genes.hg19.bed.gz?

name="$datasets/bed/genes.hg19.bed.gz"
answer_7=$(gzcat $name | cut -f2,3,4 | awk 'BEGIN { OFS = "\t"} { $4 = $2- $1 } 1' | sort -k4rn | head -n1 | cut -f3)
echo "answer-7: $answer_7"


#How many unique chromosomes are in genes.hg19.bed.gz?

chr="$datasets/bed/genes.hg19.bed.gz"
answer_8=$(gzcat $chr | cut -f1 | sort | uniq | wc -l )
echo "answer-8: $answer_8"

#How many intervals are associated with CTCF (not CTCFL) in peaks.chr22.bed.gz?

intervals="$datasets/bed/peaks.chr22.bed.gz"
answer_9=$(gzcat $intervals | grep -w CTCF | wc -l)
echo "answer-9: $answer_9"

#On what chromosome is the largest interval in lamina.bed?

chromosome="$datasets/bed/lamina.bed"
answer_10=$(cat $chromosome \
| cut -f1,2,3 \
| awk 'BEGIN {OFS = "\t"} {$4=$3-$2} 1' \
| sort -k4rn \
| head -n1 \
| cut -f1)
echo "answer-10: $answer_10"
