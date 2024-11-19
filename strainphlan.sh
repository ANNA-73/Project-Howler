#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -N 1
#SBATCH -n 24
#SBATCH -t 48:00:00
#SBATCH --mem=0
#SBATCH --job-name="strainphlan"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=FAIL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/strainphlan/str.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/strainphlan/str.err


module purge all
module load metaphlan/4.0.1


cd /projects/b1042/HartmannLab/Howler/strainphlan

mkdir -p sams
mkdir -p bowtie2
mkdir -p profiles

for f in /projects/b1042/HartmannLab/Howler/fastp-out/*_paired_1.fastq
do
    echo "Running MetaPhlAn 4.0 on ${f}"
    bn=$(basename ${f%_paired_1.fastq})
    r1=${f}
    r2=/projects/b1042/HartmannLab/Howler/fastp-out/${bn}_paired_2.fastq
    metaphlan ${r1},${r2} --input_type fastq -s sams/${bn}.sam.bz2 --bowtie2out bowtie2/${bn}.bowtie2.bz2 --bowtie2db /projects/b1180/db/metaphlan_db_2024 --nproc 24 \
    -o profiles/${bn}_profile.tsv 
done

