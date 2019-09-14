All: ostree golang conmon runc configurations

ostree:
	./build_packages.sh $@

golang:
	./build_packages.sh $@

conmon:
	./build_packages.sh $@

runc:
	./build_packages.sh $@

configurations:
	./build_packages.sh $@

PHONY: All ostree golang conmon runc configurations
