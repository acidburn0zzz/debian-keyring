#!/bin/sh
# Makes sure every key in debian-keyring-{gpg,pgp} has an entry in the
# keyids mapping file.
set -e

fail=0

for keyring in debian-keyring-gpg debian-keyring-pgp; do
	cd $keyring
	for key in 0x*; do
		if ! grep -q "^$key " ../keyids; then
			echo "$keyring: $key is not in keyids file."
			fail=1
		fi
	done
	cd ..
done

exit $fail
