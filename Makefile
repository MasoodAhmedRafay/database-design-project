report.pdf: report.tex er.png
	pdflatex report.tex

show:
	evince report.pdf

clean:
	rm -f diag.tex *.log report.pdf
