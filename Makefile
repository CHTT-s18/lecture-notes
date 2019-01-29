# Grab the list of tex files on the top level. We specifically
# ignore template.tex as it's not suitable for building.
TEX_FILES=$(filter-out template.tex, $(shell ls *.tex))

# Get a list of the desired pdfs by transforming foo.tex -> foo.pdf
PDFS=$(TEX_FILES:.tex=.pdf)

# The phony top-level goal. It will build all the pdfs.
all: $(PDFS)

# This is useful for debugging, if you need to print the value of a
# variable in this makefile simple call it with print-THE_VAR and this
# will print it.
print-%  :
	@echo $* = $($*)

# To build an actual pdf, run latexmk to build a pdf and move the resulting
# pdf to pdfs/
%.pdf:
	@ -mkdir pdfs
	latexmk -pdf $(*).tex
	@mv $(*).pdf pdfs/

clean:
	@rm -rf pdfs/ auto/ *.pdf *.aux *.bbl *.blg *.log *.fls *fdb_latexmk *.synctex.gz *.out

.PHONY: clean all install
