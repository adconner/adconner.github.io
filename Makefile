all: cv.pdf _data/cv_html.json

_cv.tex: _cv.template.tex _data/cv.yml _subs.rb
	cat $< | ruby _subs.rb > $@

cv.pdf: _cv.tex
	pdflatex $<
	mv _cv.pdf cv.pdf

_data/cv_html.json: _data/cv.yml _tohtml.py
	python _tohtml.py > $@

