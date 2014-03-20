all:

clean:

install:
	install -d $(DESTDIR)/etc/init.d
	install -d $(DESTDIR)/etc/dfw
	install -d $(DESTDIR)/etc/dfw/rules.system.d
	install -d $(DESTDIR)/etc/dfw/rules.local.d
	install -d $(DESTDIR)/etc/dfw/rules.avail.d
	install -m 755 examples/init.d/dfw   $(DESTDIR)/etc/init.d/dfw
	install -m 755 examples/dfwrc        $(DESTDIR)/etc/dfw/dfwrc
	install -m 644 dfw-gen               $(DESTDIR)/usr/bin/dfw-gen

