All: ostree golang conmon runc configurations

%:
	./build_packages.sh $@

PHONY: All ostree golang conmon runc configurations
