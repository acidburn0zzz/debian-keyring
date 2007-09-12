export JETRING_SIGN=$(shell if [ -e admins.gpg ]; then echo admins.gpg; else echo "** Warning: Generating keyring without checking signatures!" >&2 ; fi)

all: admins.gpg debian-maintainers.gpg

debian-maintainers.gpg: debian-maintainers/index
	jetring-build -I $@ debian-maintainers

admins.gpg: admins/index
	jetring-build -I $@ admins

clean:
	rm -f debian-maintainers.gpg* admins.gpg.*
