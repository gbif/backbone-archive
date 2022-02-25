# Compile all Markdown files to HTML.

MARKDOWN = $(wildcard *.md) $(wildcard */*.md)

HTML_M=$(patsubst %.md, %.html, $(MARKDOWN))

all: $(HTML_M) $(HTML_A)

%.html: %.md .header.html
	pandoc --include-before-body=.header.html --css=https://rs.gbif.org/style/human.css -o $@ $<
