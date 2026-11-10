# Resume build shortcuts. latexmk does the real work (see latexmkrc).
#   make        -> stamp the build date+time into resume.tex, build Resume_Anbu_<Mon>_<DD>_<YYYY>_<HH-MM>.pdf,
#                  delete older dated PDFs here, then replace the resume on Google Drive
#   make local  -> same as `make` (stamp, build, rename) but WITHOUT the Google Drive upload
#   make watch  -> rebuild build/resume.pdf on every save (Ctrl+C to stop; no rename, no upload)
#   make clean  -> delete the build folder

.PHONY: all local watch clean

# Build date and time, read ONCE (:=) so the PDF name and the comment always match.
# LC_ALL=C keeps the month name in English regardless of system locale.
# %d is zero-padded (Nov_05_2026); time is 24-hour local time.
# The time uses "-" in the file name because ":" is not allowed in Windows file names.
NOW      := $(shell LC_ALL=C date '+%b_%d_%Y %H %M')
DATE     := $(word 1,$(NOW))                       # Nov_10_2026
HOUR     := $(word 2,$(NOW))                       # 15
MIN      := $(word 3,$(NOW))                       # 42
# File name: Resume_Anbu_Nov_10_2026_15-42.pdf
PDF      := Resume_Anbu_$(strip $(DATE))_$(strip $(HOUR))-$(strip $(MIN)).pdf
# Comment in resume.tex: "% Built: Nov 10 2026 15:42"
STAMP    := $(subst _, ,$(strip $(DATE))) $(strip $(HOUR)):$(strip $(MIN))

# `make` = the local build below, then the Drive upload.
all: local
	@# 4. Replace the resume on Google Drive. Failures only warn; the local PDF is kept.
	@#    Run through bash so it works even without the execute bit (this repo has core.fileMode=false).
	@bash upload-to-drive.sh $(PDF) || true

# Steps 1-3: stamp, build and rename, but no upload (for drafts not ready to go public).
local:
	@# 1. Stamp the build date+time into the "% Built:" line of resume.tex.
	@#    Only rewrite the file when the stamp actually changed (two builds in the same minute).
	@grep -qx '% Built: $(STAMP)' resume.tex || sed -i 's/^% Built: .*/% Built: $(STAMP)/' resume.tex
	@# 2. Build.
	latexmk
	@# 3. Remove older dated PDFs (keep only today's), then copy the new one in.
	@find . -maxdepth 1 -name 'Resume_Anbu_*.pdf' ! -name '$(PDF)' -delete
	cp build/resume.pdf $(PDF)

watch:
	latexmk -pvc -view=none

clean:
	rm -rf build
