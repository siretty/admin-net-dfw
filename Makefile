BINDIR=$(DESTDIR)/usr/bin
ETCDIR=$(DESTDIR)/etc
DATDIR=$(DESTDIR)/usr/share

all: doc

doc:
	rm -f dfw-gen.1 dfw-gen.1.gz
	./txt2man -t dfw-gen -s 1 < dfw-gen.txt > dfw-gen.1
	gzip dfw-gen.1

clean:

install:
	install -d $(BINDIR)
	install -d $(ETCDIR)/init.d
	install -d $(ETCDIR)/dfw/rules.avail.d $(ETCDIR)/dfw/rules.system.d $(ETCDIR)/dfw/rules.local.d $(ETCDIR)/dfw/rules.local.d/filter/INPUT
	install -d $(DATDIR)/man/man1
	
	install -m 755 examples/init.d/dfw   $(ETCDIR)/init.d/dfw
	install -m 644 examples/dfwrc        $(ETCDIR)/dfw/dfwrc
	install -m 755 `find examples/rules.avail.d -name '*.gen.rules'` $(ETCDIR)/dfw/rules.avail.d
	install -m 644 `find examples/rules.avail.d -name '*.rules' -not -name '*.gen.rules'` $(ETCDIR)/dfw/rules.avail.d
	install -m 644 dfw-gen      $(BINDIR)/dfw-gen
	install -m 644 dfw-gen.1.gz $(DATDIR)/man/man1/dfw-gen.1.gz
	
	# default rule files
	ln -s ../../../rules.avail.d/stateful.rules $(ETCDIR)/dfw/rules.local.d/filter/INPUT/10-stateful.rules
	ln -s ../../../rules.avail.d/allow-dst.gen.rules $(ETCDIR)/dfw/rules.local.d/filter/INPUT/40-allow-dst-tcp-ssh.rules
	ln -s ../../../rules.avail.d/allow-icmp-ping.rules $(ETCDIR)/dfw/rules.local.d/filter/INPUT/40-allow-icmp-ping.rules

