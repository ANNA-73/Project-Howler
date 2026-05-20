#!/bin/bash
#SBATCH -A p32045
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 2:00:00
#SBATCH --mem=0
#SBATCH --job-name="prokka"
#SBATCH --output=/projects/b1057/shotgun_howlers/err/prokka_%a.out
#SBATCH --error=/projects/b1057/shotgun_howlers/err/prokka_%a.err
#SBATCH --array=1-20

fa_dir=/projects/b1057/shotgun_howlers/QC
out_path=/projects/b1057/shotgun_howlers/prokka_new

START=$(( (SLURM_ARRAY_TASK_ID - 1) * 50 ))
END=$(( START + 49 ))

FILES=(${fa_dir}/*.fa)


for i in $(seq ${START} ${END}); do
    MAG=${FILES[$i]}

    [[ ! -f "$MAG" ]] && continue   # skip if file doesn't exist

    PREFIX=$(basename ${MAG} .fa)
    mkdir -p ${out_path}/${PREFIX}  # separate dir per MAG

    prokka \
        --outdir ${out_path}/${PREFIX} \
        --prefix ${PREFIX} \
        --metagenome \
        --cpus ${SLURM_NTASKS} \
        --force \
        ${MAG}
done
