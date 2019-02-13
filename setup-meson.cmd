echo now start setup

echo setup python3 and packages
cyg-get install python3 libgcrypt20 libgpg-error0 libxslt python3-asn1crypto python3-cffi python3-chardet python3-cryptography python3-idna python3-lockfile python3-lxml python3-openssl python3-pip python3-ply python3-pycparser python3-requests python3-urllib3 python3-wheel 
echo change path and setup python
set path=c:\tools\cygwin\bin;%path%
sh python3 --version
sh python3 -m pip --version
sh python3 -m pip install pip --upgrade
sh python3 -m pip --version
uname -a
sh uname -a
dos2unix step1-bzip.sh
sh step1-bzip.sh


msiexec /i meson-0.49.2-64.msi /norestart /qn
meson --version
