all: output/debian-keyring.gpg output/debian-keyring.pgp output/debian-role-keys.gpg output/emeritus-keyring.gpg output/emeritus-keyring.pgp output/extra-keys.pgp output/removed-keys.gpg output/removed-keys.pgp

output/debian-keyring.gpg: debian-keyring-gpg/0x*
	cat debian-keyring-gpg/0x* > output/debian-keyring.gpg

output/debian-keyring.pgp: debian-keyring-pgp/0x*
	cat debian-keyring-pgp/0x* > output/debian-keyring.pgp

output/debian-role-keys.gpg: debian-role-keys-gpg/0x*
	cat debian-role-keys-gpg/0x* > output/debian-role-keys.gpg

output/emeritus-keyring.gpg: emeritus-keyring-gpg/0x*
	cat emeritus-keyring-gpg/0x* > output/emeritus-keyring.gpg

output/emeritus-keyring.pgp: emeritus-keyring-pgp/0x*
	cat emeritus-keyring-pgp/0x* > output/emeritus-keyring.pgp

output/extra-keys.pgp: extra-keys-pgp/0x*
	cat extra-keys-pgp/0x* > output/extra-keys.pgp

output/removed-keys.gpg: removed-keys-gpg/0x*
	cat removed-keys-gpg/0x* > output/removed-keys.gpg

output/removed-keys.pgp: removed-keys-pgp/0x*
	cat removed-keys-pgp/0x* > output/removed-keys.pgp

clean:
	rm output/*.pgp output/*.gpg
