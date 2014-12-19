#!/bin/bash

if [ -e ci14book_mayer.aux ]; then
   rm ci14book_mayer.aux
fi

if [ -e ci14book_mayer.pdf ]; then
    rm ci14book_mayer.pdf
fi

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
