RUSTC ?= rustc

#add your targets here
all: libfoo bin/foomain

run: bin/foomain
	./bin/foomain

# always build libfoo
.PHONY : libfoo

#lib example
libfoo:
	$(RUSTC) --out-dir bin -L bin src/foo/foo.rc

#executable example depending on libfoo
bin/foomain: src/foomain/foomain.rc src/foomain/*.rs libfoo
	$(RUSTC) -L bin -o $@ $<
