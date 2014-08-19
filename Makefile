EXECUTABLES = $(wildcard *.plx)
MODULES     = $(wildcard C101/*.pm)
PERL_FILES  = $(EXECUTABLES) $(MODULES)

all: doc test

doc: doc/perl101.html

test: results

clean:
	rm -f results serialized.bin doc/perl101.html

doc/perl101.html: $(PERL_FILES)
	cat doc/perl101.pod $(PERL_FILES) \
	| perl -MPod::Simple::HTML \
	  -e '$$p=Pod::Simple::HTML->new;$$p->index(1);$$p->parse_from_file' \
	> doc/perl101.html

results: $(PERL_FILES)
	perl test101.plx | tee results


.PHONY: all clean doc test
