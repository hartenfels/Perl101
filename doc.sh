#!/bin/sh
doc='$p=Pod::Simple::HTML->new;$p->index(1);$p->parse_from_file'

# combine all documentation and generate HTML file
cat doc/perl101.pod C101/*.pm | perl -MPod::Simple::HTML -e $doc >doc/perl101.html
