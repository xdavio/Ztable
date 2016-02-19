document.pdf: table.R document.tex
	rm -f table.tex tmp
	R --vanilla <table.R
	sed -n 'H;$${x;s/begin{tabular.*\n/tiny\n\\&/;p;}' table.tex > tmp
	rm -f table.tex
	mv tmp table.tex
	pdflatex document.tex
	cp document.pdf Ztable.pdf
