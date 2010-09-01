#!/bin/sh
# Makes sure every key in debian-keyring-gpg has an entry in the
# keyids mapping file.
set -e

fail=0

keyring=debian-keyring-gpg
cd $keyring
for key in 0x*; do
    if ! grep -q "^$key " ../keyids; then
	echo "$keyring: $key is not in keyids file."
	fail=1
    fi
done

exit $fail
