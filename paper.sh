#!/bin/sh

pdflatex -shell-escape base.tex
biber base
pdflatex -shell-escape base.tex

cp base.pdf output/paper.pdf