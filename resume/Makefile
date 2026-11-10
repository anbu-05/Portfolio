# Resume build shortcuts. latexmk does the real work (see latexmkrc).
#   make        -> stamp today's date into resume.tex, build Resume_Anbu_<Mon>_<DD>_<YYYY>.pdf,
#                  delete older dated PDFs here, then replace the resume on Google Drive
#   make watch  -> rebuild build/resume.pdf on every save (Ctrl+C to stop; no rename, no upload)
#   make clean  -> delete the build folder

.PHONY: all watch clean

# Build date, e.g. Nov_10_2026. LC_ALL=C keeps the month name in English
# regardless of system locale; %d is zero-padded (Nov_05_2026).
DATE     := $(shell LC_ALL=C date +%b_%d_%Y)
# Same date with spaces, for the comment in resume.tex: "Nov 10 2026".
DATE_TXT := $(subst _, ,$(DATE))
PDF      := Resume_Anbu_$(DATE).pdf

all:
	@# 1. Stamp the build date into the "% Built:" line of resume.tex.
	@#    Only rewrite the file when the date actually changed, to avoid touching it on every build.
	@grep -qx '% Built: $(DATE_TXT)' resume.tex || sed -i 's/^% Built: .*/% Built: $(DATE_TXT)/' resume.tex
	@# 2. Build.
	latexmk
	@# 3. Remove older dated PDFs (keep only today's), then copy the new one in.
	@find . -maxdepth 1 -name 'Resume_Anbu_*.pdf' ! -name '$(PDF)' -delete
	cp build/resume.pdf $(PDF)
	@# 4. Replace the resume on Google Drive. Failures only warn; the local PDF is kept.
	@./upload-to-drive.sh $(PDF) || true

watch:
	latexmk -pvc -view=none

clean:
	rm -rf build
