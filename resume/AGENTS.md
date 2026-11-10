<!-- agents-md: v2 · current-state · ≤4000 words · history in AGENTS.archive-*.md · index in AGENTS.archive-index.md -->
# Resume (LaTeX)

Anbu's one-page resume, built from Jake Gutierrez's MIT-licensed LaTeX template (Roboto font, Font Awesome icons). Lives inside the `portfolio` git repo, which has no root AGENTS.md, so this file is the project root for resume work.

## Layout
- `resume.tex` – the only source file.
- `latexmkrc` – pdflatex, output to `build/`, nonstop + halt on error.
- `Makefile` – `make` builds and copies the PDF to `./resume.pdf`; `make watch` rebuilds on save; `make clean` removes `build/`.
- `build/` – aux files and intermediate PDF, git-ignored.
- `resume.pdf` – the final output, kept in git.

## Toolchain
- TinyTeX in `~/.TinyTeX` (TeX Live 2026), binaries symlinked in `~/bin`. Install packages with `tlmgr install <pkg>`; no sudo needed.
- Packages added for this resume (2026-11-10): `preprint` (fullpage), `marvosym`, `fontawesome5`, `roboto`, `babel-english`, `mweights`, `fontaxes`. tlmgr itself was updated with `tlmgr update --self`.
- Must use pdflatex (template uses `\pdfgentounicode` and pdfTeX Roboto fonts).

## Decisions in force
- Must stay one page, A4 (`a4paper` in `\documentclass`).
- Rover PCB "images" link points to the gallery at `github.com/anbu-05/Portfolio/blob/main/pcb-design/README.md` (the repo was renamed from `PCB-Portfolio`; the local git remote still uses the old name, which GitHub redirects).

## Known issues
- Harmless build warnings: fancyhdr `\footskip` too small, hyperref "Token not allowed in a PDF string" (icons in the section title), small overfull boxes (≤11 pt) in the rover bullet list and project headings.
