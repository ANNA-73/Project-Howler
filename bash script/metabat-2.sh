#!/bin/sh
#SBATCH -A p32046
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 4:00:00
#SBATCH --mem=0
#SBATCH --job-name="metabat-2"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=FAIL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/metabat-2.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/metabat-2.err

module purge all


export list=(KM-26)

 for i in "${list[@]}"; do
    cd /projects/b1042/HartmannLab/Howler/
    metabat2 -i ./megahit/${i}-assembled/final.contigs.fa -a ./metabat/depth-${i}.txt -o ./bins/${i}-bin
done