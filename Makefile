PREFIX ?= /usr/local

install:
	install -Dm755 devtest $(DESTDIR)/$(PREFIX)/bin/devtest
	
uninstall:
	$(RM) $(DESTDIR)/$(PREFIX)/bin/devtest
