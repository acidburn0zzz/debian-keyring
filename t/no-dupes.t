#!/bin/sh
# Looks for keys that are duplicated in a keyring
set -e

find_dupes () {
	k=$1
	for key in $(gpg --no-options --no-auto-check-trustdb \
			--no-default-keyring --keyring "./output/keyrings/$k" \
			--list-keys --with-colons | grep '^pub' \
			| cut -d: -f 5 | sort | uniq -c | sort -n \
			| grep -v '      1 ' | sed -e 's/^ .* //'); do
		echo -e "$k:\t0x$key is duplicated"
		fail=1
	done
}

fail=0
for keyring in debian-keyring.gpg debian-maintainers.gpg \
		debian-nonupload.gpg; do
	find_dupes $keyring
done

exit $fail
