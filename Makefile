all: debian-keyring.gpg debian-keyring.pgp debian-role-keys.gpg emeritus-keyring.gpg emeritus-keyring.pgp extra-keys.pgp removed-keys.gpg removed-keys.pgp

debian-keyring.gpg: debian-keyring-gpg/0x*
	cat debian-keyring-gpg/0x* > debian-keyring.gpg

debian-keyring.pgp: debian-keyring-pgp/0x*
	cat debian-keyring-pgp/0x* > debian-keyring.pgp

debian-role-keys.gpg: debian-role-keys-gpg/0x*
	cat debian-role-keys-gpg/0x* > debian-role-keys.gpg

emeritus-keyring.gpg: emeritus-keyring-gpg/0x*
	cat emeritus-keyring-gpg/0x* > emeritus-keyring.gpg

emeritus-keyring.pgp: emeritus-keyring-pgp/0x*
	cat emeritus-keyring-pgp/0x* > emeritus-keyring.pgp

extra-keys.pgp: extra-keys-pgp/0x*
	cat extra-keys-pgp/0x* > extra-keys.pgp

removed-keys.gpg: removed-keys-gpg/0x*
	cat removed-keys-gpg/0x* > removed-keys.gpg

removed-keys.pgp: removed-keys-pgp/0x*
	cat removed-keys-pgp/0x* > removed-keys.pgp

clean:
	rm *.pgp *.gpg
