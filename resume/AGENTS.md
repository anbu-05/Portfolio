<!-- agents-md: v2 · current-state · ≤4000 words · history in AGENTS.archive-*.md · index in AGENTS.archive-index.md -->
# Resume (LaTeX)

Anbu's one-page resume, built from Jake Gutierrez's MIT-licensed LaTeX template (Roboto font, Font Awesome icons). Lives inside the `portfolio` git repo, which has no root AGENTS.md, so this file is the project root for resume work.

## Layout
- `resume.tex` – the only source file. First line `% Built: <Mon DD YYYY HH:MM>` is rewritten by `make`.
- `latexmkrc` – pdflatex, output to `build/`, nonstop + halt on error.
- `Makefile` – `make` stamps the date, builds, writes `Resume_Anbu_<Mon>_<DD>_<YYYY>_<HH-MM>.pdf` (e.g. `Resume_Anbu_Nov_05_2026_15-42.pdf`, 24-hour local time, `-` because `:` breaks Windows file names), deletes older `Resume_Anbu_*.pdf` here, then runs the Drive upload. `make local` does the same without the upload: use it for drafts and for agent builds; only plain `make` publishes. `make watch` rebuilds `build/resume.pdf` on save (no rename/upload). `make clean` removes `build/`.
- `upload-to-drive.sh` – uploads the new PDF to Google Drive and trashes older resumes there.
- `build/` – aux files and intermediate PDF, git-ignored.
- `Resume_Anbu_*.pdf` – the final output; only the latest is kept in the folder and in git.

## Toolchain
- TinyTeX in `~/.TinyTeX` (TeX Live 2026), binaries symlinked in `~/bin`. Install packages with `tlmgr install <pkg>`; no sudo needed.
- Packages added for this resume (2026-11-10): `preprint` (fullpage), `marvosym`, `fontawesome5`, `roboto`, `babel-english`, `mweights`, `fontaxes`. tlmgr itself was updated with `tlmgr update --self`.
- Must use pdflatex (template uses `\pdfgentounicode` and pdfTeX Roboto fonts).
- rclone v1.76 with remote `google-drive:` using the user's own Google client ID (set up outside this project).

## Decisions in force
- Must stay one page, A4 (`a4paper` in `\documentclass`).
- The stamp is the build date and time, only in the PDF name (and the `% Built:` comment), never in the `.tex` name. Every build in a new minute therefore changes `resume.tex` and renames the PDF.
- Drive target is the `Resume` folder (`google-drive:Resume`); the websites link to the folder, not the file, so file IDs don't matter. The script uploads the new PDF, then moves every other `Resume_Anbu_*.pdf` there to the Drive trash (`--drive-use-trash=true`), so the folder mirrors the local one (latest only). Other files there are never touched.
- Upload failures (offline, auth) only warn; `make` still succeeds and keeps the local PDF.
- Turtlebot controller board (Intuitive Evolution internship, folder `stealth_startup`) is split in two: the Experience entry (remote, Sep 2026 – present, first, above Team Vyadh) has 2 bullets on the process (design and revisions, assembly, bring-up, Rev2 plan); the Projects entry (first, above Mars Rover; slot 2 "Hardware Design & Validation") has 3 technical bullets (ESP32-S3, USB-C PD to Pi 5, 15 A power distribution for two encoder DC motors, integrated subsystems, firmware and stress test). No founder mentions. The founder approved this split version, technical bullets included (10 Nov 2026); get his OK again before adding new detail about the board. PicoRV32 was removed (Nov 2026). Source material: `~/Z/projects/internship/stealth_startup/report/report.md`.
- The page is now full; any addition needs a matching cut.
- No bullet line should end in one or two stray words; reword to fix rather than adjusting spacing.
- Rover PCB "images" link points to the gallery at `github.com/anbu-05/Portfolio/blob/main/pcb-design/README.md` (the repo was renamed from `PCB-Portfolio`; the local git remote still uses the old name, which GitHub redirects).

## Known issues
- Harmless build warnings: fancyhdr `\footskip` too small, hyperref "Token not allowed in a PDF string" (icons in the section title), small overfull boxes (≤11 pt) in the rover bullet list and project headings.
