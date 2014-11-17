To build the abstract, cd into ./abstract and run:
`pdflatex ci_mayer.tex && bibtex ci_mayer.aux && pdflatex ci_mayer.tex && pdflatex ci_mayer.tex`

which will build ci_mayer.pdf.

To build the book chapter, cd into ./book and run:

`pdflatex ci14book_mayer.tex && bibtex ci14book_mayer.aux && pdflatex ci14book_mayer.tex && pdflatex ci14book_mayer.tex`

which will compile ci14book_mayer.pdf

To automatically generate the a zip archive of the book chapter according to the springing submission guidlines, run ./book/compileZip.sh

The script ./book/buildPdf.sh will compile the book and bulid the zip archive.

To build the poster, run xelatex poster.tex in ./poster

