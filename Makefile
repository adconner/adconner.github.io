all: _cv.pdf

_cv.tex: _cv.template.tex _cv.yml _subs.rb
	 cat $< | ruby _subs.rb > $@

_cv.pdf: _cv.tex
	pdflatex $<

_cv_html.json: _cv.yml tohtml.py
	python tohtml.py > $@

