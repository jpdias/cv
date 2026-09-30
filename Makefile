MAIN ?= main
OUT ?= build
ENGINE ?= -xelatex

.PHONY: all pdf clean

all: pdf

pdf:
	@mkdir -p $(OUT)
	latexmk $(ENGINE) \
		-interaction=nonstopmode \
		-halt-on-error \
		-file-line-error \
		-outdir=$(OUT) \
		$(MAIN).tex

clean:
	latexmk -C -outdir=$(OUT) $(MAIN).tex
	rm -rf $(OUT)