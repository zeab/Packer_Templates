
#The OS name is the first paramater
OS_USERNAME=$1

#Visual Studio Code - Install
#########
#########
echo "Installing VS Code"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get -y install code
#########

#Visual Studio Code - Extentions
#########
#Running it under the vagrant user so that it stop complaining
echo "Installing VS Code Extentions"
sudo -H -u ${OS_USERNAME} bash -c 'code --install-extension donjayamanne.python'
sudo -H -u ${OS_USERNAME} bash -c 'code --install-extension PeterJausovec.vscode-docker'
#########

#Visual Studio Code - Fix Lancher
#########
echo "Fixing the VS Code Launcher Icon"
sed -i "s,Exec=/usr/share/code/code --unity-launch %U,Exec=/usr/share/code/code --disable-gpu --unity-launch %U,g" /usr/share/applications/code.desktop

#open /usr/share/applications/code.desktop
#replace  Exec=/usr/share/code/code --unity-launch %U
#with Exec=/usr/share/code/code --disable-gpu --unity-launch %U
#########
#########