#!/bin/sh
#SBATCH -A p32045
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 4:00:00
#SBATCH --mem=0
#SBATCH --job-name="strainphlan4"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=FAIL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/strainphlan/str4_%A_%a.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/strainphlan/str4_%A_%a.err
#SBATCH --array=0-12

cd /projects/b1042/HartmannLab/Howler/strainphlan

mkdir -p output

list=("t__SGB20386.fna" "t__SGB21187.fna" "t__SGB20736.fna" "t__SGB20040.fna" "t__SGB20763.fna"
      "t__SGB20085.fna" "t__SGB10068.fna" "t__SGB9306.fna"  "t__SGB4114.fna"  "t__SGB8018.fna"
      "t__SGB14954.fna" "t__SGB44527.fna" "t__SGB14042.fna")

marker=${list[$SLURM_ARRAY_TASK_ID]}
marker_base=${marker%.fna}

strainphlan -s ./consensus_markers/*.json.bz2 -m db_markers/$marker -o output -n 16 \
 -c $marker_base --mutation_rates -d /projects/b1180/db/metaphlan_db_2024/mpa_vJun23_CHOCOPhlAnSGB_202403.pkl
