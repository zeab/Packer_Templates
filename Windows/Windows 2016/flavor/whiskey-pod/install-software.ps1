#base
iex "choco install firefox -y"
iex "choco install googlechrome -y"

iex "choco install 7zip -y"

iex "choco install sdelete -y"
iex "choco install ultradefrag -y"

iex "choco install putty -y"

iex "choco install sourcetree -y"

iex "choco install notepadplusplus -y"

iex "choco install mysql.workbench -y"
iex "choco install sql-server-management-studio -y"
iex "choco install visualstudio2017community -y -timeout 10800"

.\"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\devenv.exe" /ResetSettings "a:/whiskey-pod.vssettings"

#Set server manager not to start
#New-ItemProperty -Path HKCU:\Software\Microsoft\ServerManager -Name DoNotOpenServerManagerAtLogon -PropertyType DWORD -Value “0x1” –Force

