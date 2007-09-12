export JETRING_SIGN=$(shell if [ -e admins.gpg ]; then echo admins.gpg; else echo "** Warning: Generating keyring without checking signatures!" >&2 ; fi)

all: admins.gpg debian-maintainers.gpg

debian-maintainers.gpg: debian-maintainers/index
	jetring-build -I $@ debian-maintainers

admins.gpg: admins/index
	jetring-build -I $@ admins

test:
	@fail=0; \
	total=0; \
	for t in t/*.t; do \
		total=`expr $$total + 1`; \
		if ! $$t; then \
			echo "test $$t failed" >&2; \
			fail=`expr $$fail + 1`; \
		fi; \
	done; \
	if [ "$$fail" -gt 0 ]; then \
		echo "** failed $$fail/$$total tests" >&2; \
		exit 1; \
	else \
		echo "** all tests succeeded"; \
	fi

rsync-keys:
	@mkdir -p cache
	@if [ "$$ONLINE" != n ]; then \
		echo "Updating Debian keyring cache" >&2; \
		rsync -qcltz --block-size=8192 --partial --progress --exclude='emeritus-*' --exclude='removed-*' 'keyring.debian.org::keyrings/keyrings/*' cache/; \
	else \
		echo "Not updating Debian keyring cache, OFFLINE is set" >&2; \
	fi

clean:
	rm -f debian-maintainers.gpg* admins.gpg.*

distclean: clean
	rm -rf cache
