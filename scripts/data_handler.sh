#!/bin/bash
cd `dirname $0`
CUR_DIR=$(dirname $(readlink -f "$0"))

SRC_PATH=${CUR_DIR}/../src

export PYTHONPATH=${SRC_PATH}

input_dir=$1
out_dir=$2

for N in {1..4}
do
    cd ${CUR_DIR}/../
    python src/align/align_dataset_mtcnn.py ${input_dir} ${out_dir}  \
        --image_size 160 \
        --margin 32 \
        --random_order \
        --gpu_memory_fraction 0.25
done