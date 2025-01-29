#!/bin/bash

# Exit if any command fails
set -e

echo "Cleaning previous build..."
make clean

echo "Building the project..."
make

echo "Running simulation and exporting trace..."
./demo/demo --export-trace=export_trace.bin scenario.xml

echo "Activating Python virtual environment..."
source .venv/bin/activate

echo "Navigating to visualizer directory..."
cd visualizer

echo "Running the visualizer..."
python3 visualize_export.py ../export_trace.bin
