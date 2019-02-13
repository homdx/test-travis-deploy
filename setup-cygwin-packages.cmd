@echo off
choco install cygwin --params "/NoStartMenu"
choco install cyg-get
cyg-get dos2unix patch unzip automake make bzip2 libsqlite-3-devel libtool gcc-g++ openssl-devel wget gcc doxygen libllvm5 libclang5 libedit0 libxapian30 cmake python3 libgcrypt20 libgpg-error0 libxslt python3-asn1crypto python3-cffi python3-chardet python3-cryptography python3-idna python3-lockfile python3-lxml python3-openssl python3-pip python3-ply python3-requests python3-urllib3 python3-wheel
echo setup python3 and pip
