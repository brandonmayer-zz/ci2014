# Inspired by:
# http://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project
# http://stackoverflow.com/questions/637227/makefile-for-multi-file-latex-document
# http://en.wikibooks.org/wiki/LaTeX/Modular_Documents
# https://www.gnu.org/software/make/manual/html_node/Pattern-Rules.html
# http://stackoverflow.com/questions/6751376/get-error-for-make-nothing-to-be-done-for-target

# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: ci14book_mayer all clean

all: ci14book_mayer.pdf

ci14book_mayer.pdf: ci14book_mayer.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode --shell-escape" ci14book_mayer.tex

clean:
	latexmk -CA
