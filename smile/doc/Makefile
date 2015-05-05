

include locals.mk

# -------------------------------------------------
# INKSCAPE files
# -------------------------------------------------

MAIN_CHEME_FILE=./components_scheme/smile_board_layout.svg
MAIN_CHEME_FILE_PDF=./tmp/smile_board_layout.pdf

# -------------------------------------------------
# TEX files
# -------------------------------------------------

MAIN_TEX_FILE=smile_doc_main.tex

# -------------------------------------------------
# EAGLE files
# -------------------------------------------------

# -------------------------------------------------
# BUILD
# -------------------------------------------------

all: mkd schemepdf tex

tex:
	$(PDFLATEX) $(MAIN_TEX_FILE)

schemepdf:
	$(INKSCAPE) $(MAIN_CHEME_FILE) --export-pdf=$(MAIN_CHEME_FILE_PDF)
	
mkd:
	mkdir -p tmp
	
clean:
	rm -rf ./tmp
	rm -f *.log
	rm -f *.lof
	rm -f *.aux
	rm -f *.toc
	rm -f $(MAIN_CHEME_FILE_PDF)