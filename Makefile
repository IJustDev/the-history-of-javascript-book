all: all-before dist/book.epub dist/book.pdf

all-before:
	mkdir -p dist

dist/book.epub: $(wildcard chapters/*) $(wildcard resources/**/*) Makefile
	pandoc --toc --toc-depth=2 -f markdown --css resources/styling.css -o dist/book.epub chapters/* \
	       --epub-cover-image=./resources/cover.jpg
	

dist/book.pdf: $(wildcard chapters/*) $(wildcard resources/**/*) Makefile
	pandoc --toc --toc-depth=2 -f markdown \
	       --css resources/styling.css \
	       -o dist/book.pdf chapters/* \
	       -V papersize=A5 \
	       -V documentclass=book \
	       -V mainfont="Proxima Nova" \
	       -V geometry:margin=0.95in \
	       --pdf-engine pdflatex \
	       --epub-cover-image=./resources/cover.jpg \
	       --highlight-style=monochrome

clean:
	rm -r dist
