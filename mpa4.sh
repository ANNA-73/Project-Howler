#!/bin/sh
#SBATCH -A p32046
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 4:00:00
#SBATCH --mem=0
#SBATCH --job-name="mpa4"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/mpa4.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/mpa4.err


module purge all
module load metaphlan/4.0.1

export list=(KM-12   KM-126  KM-137  KM-141  KM-151  KM-155  KM-165  KM-176  KM-180  KM-191  KM-195  KM-205  KM-209  KM-25  KM-37  KM-42  KM-56  KM-65  KM-70  KM-81
KM-101  KM-112  KM-123  KM-127  KM-138  KM-142  KM-152  KM-162  KM-166  KM-177  KM-181  KM-192  KM-196  KM-206  KM-21   KM-26  KM-39  KM-50  KM-57  KM-68  KM-71
KM-109  KM-113  KM-124  KM-129  KM-139  KM-149  KM-153  KM-163  KM-167  KM-178  KM-183  KM-193  KM-203  KM-207  KM-22   KM-29  KM-40  KM-51  KM-6   KM-69  KM-79
KM-110  KM-116  KM-125  KM-136  KM-140  KM-150  KM-154  KM-164  KM-169  KM-179  KM-190  KM-194  KM-204  KM-208  KM-24   KM-36  KM-41  KM-53  KM-64  KM-7   KM-80)

cd /projects/b1042/HartmannLab/Howler/fastp-out
for i in ${list[@]:0:3}; do
  touch ../mpa4/profiled_${i}.txt
  metaphlan clean-${i}_paired_1.fastq,clean-${i}_paired_2.fastq --input_type fastq \
  --bowtie2db /projects/b1180/db/metaphlan_db/ --nproc 24 --bowtie2out ${i}.bowtie2.bz2 > ../mpa4/profiled_${i}.txt
done