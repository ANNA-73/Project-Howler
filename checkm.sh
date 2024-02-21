#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomicslong
#SBATCH -N 1
#SBATCH -n 24
#SBATCH -t 72:00:00
#SBATCH --mem=0
#SBATCH --job-name="checkm"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=FAIL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/checkm.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/checkm.err

module purge all
module load checkm/1.0.7

cd /projects/b1042/HartmannLab/Howler/
checkm lineage_wf -t 24 -x fa  ./bins ./checkM_results --tab_table -f  ./checkM_results/CheckM_summary_table.tsv