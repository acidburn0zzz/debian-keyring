#!/bin/sh
# Looks for revoked keys in our active keyrings
set -e

find_too_short () {
	k=$1
	gpg --no-options --no-auto-check-trustdb --no-default-keyring \
		--keyring "./output/keyrings/$k" --list-keys --with-colons \
		| awk -F: -v keyring=$1 \
		'BEGIN { ok = 1 } \
		/^pub/ { fpr = $5 ; if ($3 < 2048) { print keyring ":\t0x" $5 " is smaller than 2048 bits"; ok = 0 } } \
		/^sub/ { if ($2 != "r" && $2 != "e" && $3 < 2048 && $4 < 18) { print keyring ":\t0x" fpr " has subkey smaller than 2048 bits"; ok = 0 } } \
		END { if (!ok) { exit 1 } }'
}

fail=0
for keyring in debian-keyring.gpg debian-maintainers.gpg \
		debian-nonupload.gpg debian-role-keys.gpg; do
	find_too_short $keyring
done

exit $fail
