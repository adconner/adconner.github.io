all: _cv.pdf

_cv.tex: _cv.template.tex _cv.yml
	 cat $< | ruby _subs.rb > $@

_cv.pdf: _cv.tex
	pdflatex $<


