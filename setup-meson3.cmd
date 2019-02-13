echo change path
set PATH="C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0;C:\Windows\System32\OpenSSH;C:\ProgramData\GooGet;C:\Program Files\Google\Compute Engine\metadata_scripts;C:\Program Files (x86)\Google\Cloud SDK\google-cloud-sdk\bin;C:\Program Files\Google\Compute Engine\sysprep;C:\Program Files\Docker;C:\ProgramData\chocolatey\bin;C:\Program Files\CMake\bin;C:\Program Files\Git\cmd;%PATH%"
setup with powershell
powershell Start-Process msiexec.exe -Wait -ArgumentList '/I meson-0.49.2-64.msi /quiet /norestart'
echo setup done
dir "C:\Program Files"
dir "C:\Program Files\Meson"
"C:\Program Files\Meson\meson.exe"
