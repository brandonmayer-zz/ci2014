#!/bin/bash
if pdflatex ci14book_mayer.tex && \
bibtex ci14book_mayer.aux && \
pdflatex ci14book_mayer.tex && \
pdflatex ci14book_mayer.tex
then
    . compileZip.sh
    echo "BUILD SUCESSFUL"
else
    echo "PDF FAILED TO BUILD PROPERLY!!!"
fi
