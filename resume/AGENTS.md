<!-- agents-md: v2 · current-state · ≤4000 words · history in AGENTS.archive-*.md · index in AGENTS.archive-index.md -->
# Resume (LaTeX)

Anbu's one-page resume, built from Jake Gutierrez's MIT-licensed LaTeX template (Roboto font, Font Awesome icons). Lives inside the `portfolio` git repo, which has no root AGENTS.md, so this file is the project root for resume work.

## Layout
- `resume.tex` – the only source file. First line `% Built: <Mon DD YYYY HH:MM>` is rewritten by `make`.
- `latexmkrc` – pdflatex, output to `build/`, nonstop + halt on error.
- `Makefile` – `make` stamps the date, builds, writes `Resume_Anbu_<Mon>_<DD>_<YYYY>_<HH-MM>.pdf` (e.g. `Resume_Anbu_Nov_05_2026_15-42.pdf`, 24-hour local time, `-` because `:` breaks Windows file names), deletes older `Resume_Anbu_*.pdf` here, then runs the Drive upload. `make watch` rebuilds `build/resume.pdf` on save (no rename/upload). `make clean` removes `build/`.
- `upload-to-drive.sh` – replaces the resume on Google Drive in place.
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
- Drive target is the `Resume` folder (`google-drive:Resume`), which is linked from the user's websites. The script renames the existing `Resume_Anbu_*.pdf` there (server-side rename keeps the file ID) and overwrites its contents, so links never break. It refuses to act if more than one `Resume_Anbu_*.pdf` is in the folder. Other files there are never touched.
- Upload failures (offline, auth) only warn; `make` still succeeds and keeps the local PDF.
- Rover PCB "images" link points to the gallery at `github.com/anbu-05/Portfolio/blob/main/pcb-design/README.md` (the repo was renamed from `PCB-Portfolio`; the local git remote still uses the old name, which GitHub redirects).

## Known issues
- Harmless build warnings: fancyhdr `\footskip` too small, hyperref "Token not allowed in a PDF string" (icons in the section title), small overfull boxes (≤11 pt) in the rover bullet list and project headings.
