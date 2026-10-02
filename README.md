# CV

LaTeX sources for [jpdias.me](https://jpdias.me) — built from `main.tex` and
published to [`jpdias/jpdias.github.io`](https://github.com/jpdias/jpdias.github.io).

## Building

Needs TeX Live with `latexmk`, `xelatex` and `biber`. The document loads
`fontspec`, so it must **not** be built with pdfLaTeX.

```sh
make pdf      # compiles into build/main.pdf
make clean
```

`make pdf MAIN=other` builds a different root document. `latexmk` runs `biber`
automatically for the `biblatex` entries, so no separate bibliography step is
needed.

## Continuous integration

`.github/workflows/build.yml` runs on every push to `main`, on pull requests,
and manually from the Actions tab. It:

1. compiles `main.tex` with `latexmk` + XeLaTeX;
2. fails the run if any `\fullcite` was left unresolved by biber;
3. uploads `build/main.pdf` as the `cv` artifact;
4. opens or updates a pull request against `jpdias/jpdias.github.io` that
   replaces `assets/jpdias.pdf`.

Step 4 needs the `CROSS_REPO_TOKEN` secret: a fine-grained personal access
token with *Contents: read and write* and *Pull requests: read and write* on
`jpdias/jpdias.github.io`, added under *Settings → Secrets and variables →
Actions*. The runner's own `GITHUB_TOKEN` cannot write to another repository, so
a separate token is required. While the secret is unset the build still runs and
the publishing step is skipped.

Pull requests are opened but never merged automatically — review and merge
[PR #95](https://github.com/jpdias/jpdias.github.io/pull/95) to publish.

Note that the PDF embeds its creation date, so every run produces a new file
even when the sources did not change, and the pull request is refreshed
accordingly.

## Files

| File | Purpose |
| --- | --- |
| `main.tex` | The CV, the only document in the repository. |
| `reference-personal.bib` | Bibliography cited by `main.tex`. |
| `Makefile` | Local build entry point, mirroring what CI runs. |

Earlier drafts of the CV (`main-academic.tex`, `main-old.tex`, `bckp.tex`) and
the standalone `selectedPapers.tex`, `scientificprogram.tex` and
`motivation.tex` documents were removed; they remain in the git history if you
ever need them back.