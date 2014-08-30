practical.pdf: practical.Rnw
	Rscript -e "library(knitr); forStudents <- TRUE; knit('practical.Rnw')"
	pdflatex practical.tex
	mv practical.pdf practical_for_students.pdf
	Rscript -e "library(knitr); forStudents <- FALSE; knit('practical.Rnw')"
	pdflatex practical.tex
	mv practical.pdf practical_with_answers.pdf

clean:
	rm *.pdf *.tex