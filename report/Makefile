short:
	@echo "Building LaTeX files"
	@mkdir .tmp -p
	@pdflatex -output-directory .tmp index.tex
	@pdflatex -output-directory .tmp index.tex
	@mv .tmp/index.pdf report.pdf
	evince report.pdf

report:
	@echo "Building LaTeX files"
	@mkdir .tmp -p
	@pdflatex -output-directory .tmp index.tex
	@cp references.bib .tmp/references.bib
	@cd .tmp; bibtex index.aux
	@pdflatex -output-directory .tmp index.tex
	@pdflatex -output-directory .tmp index.tex
	@mv .tmp/index.pdf report.pdf
	evince report.pdf

results:
	@echo "Building LaTeX tables standalone"
	@pdflatex standalone_tables.tex
	@pdflatex standalone_tables.tex
	@mv standalone_tables.pdf tables.pdf
	evince tables.pdf

clean:
	@echo "Removing LaTeX build files"
	@rm -f *.out *.aux *.toc *.log *.lof *.bbl *.blg *.acn
	@rm -fr results/*.out results/*.aux *.toc *.log *.lof *.bbl *.blg *.acn
	@rm -fr .tmp/

