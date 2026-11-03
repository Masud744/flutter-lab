#!/bin/bash
# ==============================================================================
# Build Script for Flutter Lab Report 03
# ==============================================================================

set -e

cd "$(dirname "$0")"

echo "================================================="
echo " Building Flutter Lab Report PDF..."
echo "================================================="

pdflatex -interaction=nonstopmode main.tex > /dev/null
pdflatex -interaction=nonstopmode main.tex > /dev/null

# Generate primary output
cp main.pdf "2201032_Report_3.pdf"
# Also keep alias 2201032_Report_2.pdf if needed
cp main.pdf "2201032_Report_2.pdf"

rm -f *.aux *.log *.out main.pdf

echo " SUCCESS! Output generated:"
echo " -> $(pwd)/2201032_Report_3.pdf"
echo " -> $(pwd)/2201032_Report_2.pdf"
echo "================================================="
