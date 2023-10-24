#!/bin/sh
#SBATCH -A p32045
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 1:00:00
#SBATCH --mem=0
#SBATCH --job-name="fastp"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/fastp.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/fastp.err


module purge all
module load fastp/0.23.4

cd /projects/b1042/HartmannLab/Howler/kneaddata

export list=(KM-113 )

for i in ${list[@]}; do
    cd /projects/b1042/HartmannLab/Howler/kneaddata/${i}
    fastp --in1 ${i}_R1_kneaddata_paired_1.fastq -o ../../fastp-out/clean-${i}_paired_1.fastq --in2 ${i}_R1_kneaddata_paired_2.fastq  -O ../../fastp-out/clean-${i}_paired_2.fastq --detect_adapter_for_pe  --thread 10

done


