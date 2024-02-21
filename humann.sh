#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -N 1
#SBATCH -n 24
#SBATCH -t 48:00:00
#SBATCH --mem=96G
#SBATCH --job-name="humann"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=FAIL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/humann.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/humann.err


module purge all
module load metaphlan

export list=(KM-79)

cd /projects/b1042/HartmannLab/Howler/
for i in "${list[@]}"; do
    echo "$i"
    humann  -i cat/${i}.fastq  --input-format fastq \
    --metaphlan-options="--index mpa_vJan21_CHOCOPhlAnSGB_202103 --bowtie2db /projects/b1042/HartmannLab/Anna/vjan21"  -o humann/${i} --threads 24 --resume --verbose
done