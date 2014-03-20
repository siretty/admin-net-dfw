all:

clean:

install:
	install -d /etc/dfw
	install -d /etc/dfw/rules.system.d
	install -d /etc/dfw/rules.local.d
	install -d /etc/dfw/rules.avail.d
	install -m 755 examples/init.d/dfw   /etc/init.d/dfw
	install -m 755 examples/dfwrc        /etc/dfw/dfwrc
	install -m 644 dfw-gen               /usr/bin/dfw-gen

