#!/bin/bash

# Script to run humann_renorm_table on all gene family files

PARENT_DIR="/projects/b1042/HartmannLab/Howler/unstart_humann"

count=0


for dir in "$PARENT_DIR"/*/; do
    
    
    basename=$(basename "$dir")
    
    
    input_file="${dir}${basename}_genefamilies.tsv"
    
    
    output_file="${dir}${basename}_genefamilies-cpm.tsv"
    
   
    if [ -f "$input_file" ]; then
        
        echo "Processing: $basename"
        echo "  Input: $input_file"
        echo "  Output: $output_file"
        
        
        humann_renorm_table \
            --input "$input_file" \
            --output "$output_file" \
            --units cpm \
            --update-snames
        
        
        if [ $? -eq 0 ]; then
            echo "  ✓ Successfully normalized $basename"
            ((count++))
        else
            echo "  ✗ Error processing $basename"
        fi
        
        echo ""
        
    else
        echo "Warning: File not found - $input_file"
        echo ""
    fi
    
done
