#!/bin/sh
#SBATCH -A p32045
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 4:00:00
#SBATCH --mem=0
#SBATCH --job-name="quast"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=FAIL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/quast.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/quast.err


module purge all
module load quast/5.2.0

cd /projects/b1042/HartmannLab/Howler/

export list=(KM-10 KM-100 KM-101 KM-109 KM-110 KM-111 KM-112 KM-113 KM-115 KM-116 KM-12 KM-123 KM-124 KM-125 KM-126 KM-127 \
 KM-128 KM-129 KM-136 KM-137 KM-138 KM-139 KM-140 KM-141 KM-142 KM-149 KM-150 KM-151 KM-152 KM-153 KM-154 KM-155 KM-162 KM-163 KM-164 \
 KM-165 KM-166 KM-167 KM-169 KM-176 KM-177 KM-178 KM-179 KM-180 KM-181 KM-183 KM-190 KM-191 KM-192 KM-193 KM-194 KM-195 KM-196 KM-203 KM-204 KM-205 \
 KM-206 KM-207 KM-208 KM-209 KM-21 KM-22 KM-24 KM-25 KM-26 KM-29 KM-36 KM-37 KM-39 KM-40 KM-41 KM-42 KM-50 KM-51 KM-53 KM-55 KM-56 KM-57 KM-6 KM-64 KM-65 \
 KM-68 KM-69 KM-7 KM-70 KM-71 KM-79 KM-8 KM-80 KM-81 KM-82 KM-84 KM-86 KM-87 KM-9 KM-94 KM-95 KM-96 KM-98 KM-99)

for i in "${list[@]:0:101}"; do
    quast.py  ./megahit/${i}-assembled/final.contigs.fa
done 