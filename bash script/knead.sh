#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 10:00:00
#SBATCH --mem=0
#SBATCH --job-name="knead-howler"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --output=/projects/b1042/HartmannLab/Howler/knead.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/knead.err

module purge all

cd /projects/b1042/HartmannLab/Howler/Merged_raw_sequences

export list=(KM-140)

for i in "${list[@]}"; do


    kneaddata --input "${i}_R1.fastq.gz" --input "${i}_R2.fastq.gz" --reference-db /projects/b1042/HartmannLab/Howler/decon-genome -o /projects/b1042/HartmannLab/Howler/kneaddata/$(basename "${i}") --threads 16


done

