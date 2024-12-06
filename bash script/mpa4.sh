#!/bin/sh
#SBATCH -A p32046
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 4:00:00
#SBATCH --mem=0
#SBATCH --job-name="mpa4"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=FAIL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/mpa4.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/mpa4.err


module purge all
module load metaphlan/4.0.1

export list=(KM-79 KM-177 KM-128 KM-82)

cd /projects/b1042/HartmannLab/Howler/fastp-out
for i in ${list[@]}; do
  touch ../mpa4/profiled_${i}.txt
  metaphlan  ${i}_paired_1.fastq,${i}_paired_2.fastq --input_type fastq \
  --bowtie2db /projects/b1180/db/metaphlan_db/ --nproc 16 --bowtie2out ${i}.bowtie2.bz2 > ../mpa4/profiled_${i}.txt
done