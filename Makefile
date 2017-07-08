HOOKDIR = /usr/share/openrc-services/hooks
SCRIPTDIR = /usr/share/openrc-services/scripts
CONFDIR = /etc

HOOKS = \
	svc-openrc-install.hook \
	svc-openrc-upgrade.hook \
	svc-openrc-remove.hook
	
SCRIPTS = \
	svc-openrc.script
	
CONF = \
	openrc-services.conf

install:
	install -dm0755 $(DESTDIR)$(HOOKDIR)
	install -dm0755 $(DESTDIR)$(SCRIPTDIR)
	install -m0644 ${HOOKS} $(DESTDIR)$(HOOKDIR)
	install -m0755 ${SCRIPTS} $(DESTDIR)$(SCRIPTDIR)
	install -dm0755 $(DESTDIR)$(CONFDIR)
	install -m0644 ${CONF} $(DESTDIR)$(CONFDIR)
	sed -e "s#@CONFDIR@#${CONFDIR}#" -i $(DESTDIR)$(CONFDIR)/openrc-services.conf
	sed -e "s#@CONFDIR@#${CONFDIR}#" -i $(DESTDIR)$(SCRIPTDIR)/svc-openrc.script

uninstall:
	for f in ${HOOKS}; do rm -f $(DESTDIR)$(HOOKDIR)/$$f; done
	rmdir -p $(DESTDIR)$(HOOKDIR)
	for f in ${SCRIPTS}; do rm -f $(DESTDIR)$(SCRIPTDIR)/$$f; done
	rmdir -p $(DESTDIR)$(SCRIPTDIR)
	for f in ${CONF}; do rm -f $(DESTDIR)$(CONFDIR)/$$f; done
	rmdir -p $(DESTDIR)$(CONFDIR)

.PHONY: install uninstall
