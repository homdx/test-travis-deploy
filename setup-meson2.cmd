echo change path and setup python and run bzip script

wget https://github.com/mesonbuild/meson/releases/download/0.50.0/meson-0.50.0-64.msi && cmd /c msiexec /i meson-0.50.0-64.msi
msiexec /i meson-0.50.0-64.msi /quiet /qn /norestart /log meson-install-log.log
