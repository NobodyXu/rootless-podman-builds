All: ostree golang conmon runc configurations

install=cd $(1) && ./install.sh

ostree:
	$(call install $@)

golang:
	$(call install $@)

conmon:
	$(call install $@)

runc:
	$(call install $@)

configurations:
	cd $@ && ./configure.sh

PHONY: All ostree golang conmon runc configurations
