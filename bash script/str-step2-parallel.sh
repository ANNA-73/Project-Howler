#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -N 1
#SBATCH -n 24
#SBATCH --array=0-6
#SBATCH -t 48:00:00
#SBATCH --mem=0
#SBATCH --job-name="strainphlan2"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=FAIL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/strainphlan/str2_%A_%a.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/strainphlan/str2_%A_%a.err


module purge all
module load metaphlan/4.0.1





directories=("Dos" "Hugo" "Maia" "Melanie" "Uno" "Isa" "Jupiler")

dir=${directories[$SLURM_ARRAY_TASK_ID]}


sample2markers.py -i ${dir}/*.sam.bz2 -o consensus_markers --nproc 24
