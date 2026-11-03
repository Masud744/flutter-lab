#!/bin/bash
# ==============================================================================
# 1-Click Build Script for Flutter Lab Report 01
# ==============================================================================

set -e

# Change directory to where this script is located
cd "$(dirname "$0")"

echo "================================================="
echo " Building Flutter Lab Report 01 PDF..."
echo "================================================="

# Compile LaTeX document with pdflatex
echo "[1/2] Compiling LaTeX document (main.tex)..."
pdflatex -interaction=nonstopmode main.tex > /dev/null
pdflatex -interaction=nonstopmode main.tex > /dev/null

# Copy to final output and clean auxiliary files
REPORT_PDF="2201032_Report_1.pdf"
cp main.pdf "$REPORT_PDF"
rm -f *.aux *.log *.out main.pdf

echo "[2/2] Done!"
echo "================================================="
echo " SUCCESS! Output generated:"
echo " -> $(pwd)/$REPORT_PDF"
echo "================================================="

