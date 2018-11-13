report.pdf: report.tex diagram.erdplus erdplus-to-latex.py
	rm -f diag.tex
	./erdplus-to-latex.py diagram.erdplus > diag.tex
	pdflatex report.tex

show:
	evince report.pdf

clean:
	rm -f diag.tex *.log report.pdf
