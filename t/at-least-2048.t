#!/bin/sh
# Looks for revoked keys in our active keyrings
set -e

find_too_short () {
	k=$1
	gpg --no-options --no-auto-check-trustdb --no-default-keyring \
		--keyring "./output/keyrings/$k" --list-keys --with-colons \
		| grep -a '^pub' \
		| awk -F: -v keyring=$1 \
		'$3 < 2048 {print keyring ":\t0x" $5 " is smaller than 2048 bits"}'
}

fail=0
for keyring in debian-keyring.gpg debian-maintainers.gpg \
		debian-nonupload.gpg debian-role-keys.gpg; do
	find_too_short $keyring
done

exit $fail
