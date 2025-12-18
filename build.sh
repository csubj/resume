#!/bin/bash

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Building Docker image...${NC}"
docker build -t resume-builder .

# Ensure pdf directory exists
mkdir -p pdf

echo -e "${BLUE}Compiling resume...${NC}"
docker run --rm \
  -v "$(pwd):/workspace" \
  -w /workspace \
  resume-builder

echo -e "${GREEN}Done! Check pdf/resume.pdf${NC}"

