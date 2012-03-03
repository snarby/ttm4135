@echo off
if "%1" == "clean" goto clean
echo "Building LaTeX files"
mkdir tmp
if "%1" == "" goto short
if "%1" == "report" goto report
echo "Unknown command %1"
goto :eof

:clean
    echo "Removing LaTeX build files"
    del /S *.aux *.toc *.log *.out *.lof *.lot *.bbl *.blg *.acn
    rmdir /S /Q tmp
    goto :eof

:short
    pdflatex -output-directory tmp index.tex
    pdflatex -output-directory tmp index.tex
    move /Y tmp\index.pdf report.pdf
    start report.pdf
    goto :eof

:report
    pdflatex -output-directory tmp index.tex
    copy /y references.bib tmp\references.bib
    cd tmp
    bibtex index.aux
    cd ..
    pdflatex -output-directory tmp index.tex
    pdflatex -output-directory tmp index.tex
    move /Y tmp\index.pdf report.pdf
    start report.pdf
    goto :eof

