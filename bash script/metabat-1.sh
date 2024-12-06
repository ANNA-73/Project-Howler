#!/bin/sh
#SBATCH -A p32045
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 4:00:00
#SBATCH --mem=0
#SBATCH --job-name="metabat-1"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=FAIL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/metabat-1.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/metabat-1.err

module purge all
cd /projects/b1042/HartmannLab/Howler/bowtie

export list=(KM-26)

 for i in "${list[@]}"; do

    jgi_summarize_bam_contig_depths --outputDepth ../metabat/depth-${i}.txt  ${i}.bowtie2.sorted.bam
done
