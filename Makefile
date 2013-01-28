MAIN_FILE_NAME = TexBook
EMPTY_FILES    = TexBook.toc $(MAIN_FILE_NAME).bib
GENERATED_FILES = $(MAIN_FILE_NAME).help $(MAIN_FILE_NAME).log


all: $(MAIN_FILE_NAME).pdf

empty-files:
	touch $(EMPTY_FILES)

# the file need to be compiled two times in order to build the TOC
$(MAIN_FILE_NAME).dvi: $(MAIN_FILE_NAME).tex empty-files
	tex $<
	tex $<

$(MAIN_FILE_NAME).pdf: $(MAIN_FILE_NAME).dvi
	dvipdf $<

clean:
	rm -f $(EMPTY_FILES) $(GENERATED_FILES) $(MAIN_FILE_NAME).dvi $(MAIN_FILE_NAME).pdf
