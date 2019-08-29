#!/bin/bash

set -e
set -u
set -o pipefail

mergePeaks *peaks -venn homer_mergePeak_stats.txt > mergedPeaks.txt

grep -v "^#" mergedPeaks.txt | awk 'BEGIN {OFS = "\t"} {score=0;print $2,$3,$4,$1,score,$5}' > merged.bed
