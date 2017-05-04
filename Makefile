all: output/keyrings/debian-keyring.gpg output/keyrings/debian-maintainers.gpg output/keyrings/debian-nonupload.gpg output/keyrings/debian-role-keys.gpg output/keyrings/emeritus-keyring.gpg output/sha512sums.txt output/README output/changelog

output/keyrings/debian-keyring.gpg: debian-keyring-gpg/0x*
	cat debian-keyring-gpg/0x* > output/keyrings/debian-keyring.gpg

output/keyrings/debian-maintainers.gpg: debian-maintainers-gpg/0x*
	cat debian-maintainers-gpg/0x* > output/keyrings/debian-maintainers.gpg

output/keyrings/debian-nonupload.gpg: debian-nonupload-gpg/0x*
	cat debian-nonupload-gpg/0x* > output/keyrings/debian-nonupload.gpg

output/keyrings/debian-role-keys.gpg: debian-role-keys-gpg/0x*
	cat debian-role-keys-gpg/0x* > output/keyrings/debian-role-keys.gpg

output/keyrings/emeritus-keyring.gpg: emeritus-keyring-gpg/0x*
	cat emeritus-keyring-gpg/0x* > output/keyrings/emeritus-keyring.gpg

output/sha512sums.txt: output/keyrings/debian-keyring.gpg output/keyrings/debian-maintainers.gpg output/keyrings/debian-nonupload.gpg output/keyrings/debian-role-keys.gpg output/keyrings/emeritus-keyring.gpg
	cd output; sha512sum keyrings/* > sha512sums.txt

output/README: README
	cp README output/

output/changelog: debian/changelog
	cp debian/changelog output/

test: all
	./runtests

clean:
	rm -f output/keyrings/*.gpg output/sha512sums.txt output/README output/changelog output/keyrings/*~
