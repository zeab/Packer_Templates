#Install Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get -y install code

#Fix the launcher
#open /usr/share/applications/code.desktop
#replace  Exec=/usr/share/code/code --unity-launch %U
#with Exec=/usr/share/code/code --disable-gpu --unity-launch %U