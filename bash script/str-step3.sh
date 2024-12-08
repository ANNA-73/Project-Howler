#!/bin/sh
#SBATCH -A p32045
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 4:00:00
#SBATCH --mem=0
#SBATCH --job-name="strainphlan3"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=FAIL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/strainphlan/str3.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/strainphlan/str3.err




list=("t__SGB20386" "t__SGB21187" "t__SGB20736" "t__SGB20040" "t__SGB20763"
      "t__SGB20085" "t__SGB10068" "t__SGB9306"  "t__SGB4114"  "t__SGB8018"
      "t__SGB14954" "t__SGB44527" "t__SGB14042" "t__SGB1871"  "t__SGB6190"
      "t__SGB79840" "t__SGB6328"  "t__SGB14940" "t__SGB9202")


for i in "${list[@]}"
do
   extract_markers.py -c "$i" -o db_markers -d /projects/b1180/db/metaphlan_db_2024/mpa_vJun23_CHOCOPhlAnSGB_202403.pkl
done
