echo change path and setup python and run bzip script
c:\tools\cygwin\cygwin.bat <step1-bzip.sh
c:\tools\cygwin\cygwin.bat python3 -m pip --version
c:\tools\cygwin\cygwin.bat uname -a
set path=c:\tools\cygwin\bin;c:\tools\cygwin\usr\bin;c:\tools\cygwin\sbin;%path%
python3 --version
python3 -m pip --version
python3 -m pip install pip --upgrade
python3 -m pip --version
echo uname
uname -a
echo sh uname
sh uname -a
dos2unix step1-bzip.sh
sh step1-bzip.sh


msiexec /i meson-0.49.2-64.msi /norestart /qn
meson --version
