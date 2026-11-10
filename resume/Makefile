# Resume build shortcuts. latexmk does the real work (see latexmkrc).
#   make        -> build build/resume.pdf and copy it to ./resume.pdf
#   make watch  -> rebuild on every save (Ctrl+C to stop)
#   make clean  -> delete the build folder

.PHONY: all watch clean

all:
	latexmk
	cp build/resume.pdf resume.pdf

watch:
	latexmk -pvc -view=none

clean:
	rm -rf build
