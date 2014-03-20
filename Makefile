all: doc

doc:
	rm -f dfw-gen.1 dfw-gen.1.gz
	./txt2man -t dfw-gen -s 1 < dfw-gen.txt > dfw-gen.1
	gzip dfw-gen.1

clean:

install:
	install -d $(DESTDIR)/etc/init.d
	install -d $(DESTDIR)/etc/dfw
	install -d $(DESTDIR)/etc/dfw/rules.system.d
	install -d $(DESTDIR)/etc/dfw/rules.local.d
	install -d $(DESTDIR)/etc/dfw/rules.avail.d
	install -d $(DESTDIR)/usr/bin
	install -d $(DESTDIR)/usr/share/man/man1
	install -m 755 examples/init.d/dfw   $(DESTDIR)/etc/init.d/dfw
	install -m 644 examples/dfwrc        $(DESTDIR)/etc/dfw/dfwrc
	install -m 644 dfw-gen               $(DESTDIR)/usr/bin/dfw-gen
	install -m 644 dfw-gen.1.gz	     $(DESTDIR)/usr/share/man/man1/dfw-gen.1.gz

