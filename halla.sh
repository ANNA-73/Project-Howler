#!/bin/sh
#SBATCH -A p32046
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 4:00:00
#SBATCH --mem=0
#SBATCH --job-name="halla"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=FAIL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/halla/halla.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/halla/halla.err

module purge all

module load halla

cd /projects/b1042/HartmannLab/Howler/halla

halla -x howlermeta_binary_transposed.txt -y edited_genus_data.txt -m spearman -o Howler-halla-genus-binary --num_threads 16 
