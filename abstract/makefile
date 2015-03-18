#this is /ci2014/makefile

.PHONY: ci_mayer all clean

all: ci_mayer.pdf

ci_mayer.pdf: ci_mayer.tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode --shell-escape" ci_mayer.tex

clean:
	latexmk -CA
