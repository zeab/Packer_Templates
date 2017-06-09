#!/bin/sh -x

echo "Installing the Standard Dev Enviroment for Whiskey Pod"

#Enviroment Variables
OS_USERNAME=${OS_USERNAME:-vagrant}

#Terminal - Fix Lang Issues
#########
#########
#Not actually installing terminal here just fixing it so that it works
#edit /etc/defualt/locale
#change the two lines so they read correctly
echo "Fixing terminal issues"
sed -i 's,LANG="en_US",LANG="en_US.UTF-8",g' /etc/default/locale
sed -i 's,LANGUAGE="en_US:",LANGUAGE="en_US",g' /etc/default/locale
#########
#########

#Install Git	
#########
#sudo -H -u ${OS_USERNAME} bash -c 'apt-get update'
sudo apt update
sudo apt install -y git
#FOR SOME REASON THIS DOESNT WORK!!! I mean it installs but then once i actuaally get to the desktop it is like um no git installed
#sudo apt-get -f install
#sudo apt update
#sudo apt upgrade
#sudo apt-get check
#sudo apt install git
#########
	
	
#Install 7zip (becuase 7zip is awesome)	
#sh /media/floppy0/install-7zip.sh
#########
echo "Installing 7-zip"
sudo apt-get update
sudo apt-get install -y p7zip-full
#########


##INSTALL JAVA8 from an install file rather than have the code here...this is a beta now i now where the friggen floppy files are mounted
#sh /media/floppy0/install-java8.sh
#########
echo "Installing Java 8"
apt-get update
apt-get install -y  software-properties-common
add-apt-repository ppa:webupd8team/java -y
apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install -y oracle-java8-installer
#########

#Install IntelliJ
#sh /media/floppy0/install-intellij.sh
#Install IntelliJ / Creates Launcher Icon / Add Auto Start on Login
#########
#########
echo "Installing IntelliJ"
wget -O /tmp/intellij.tar.gz https://download-cf.jetbrains.com/idea/ideaIC-2017.1.tar.gz &&
mkdir /tmp/intellij/ &&
tar xfz /tmp/intellij.tar.gz -C /tmp/intellij/ &&
mkdir /usr/share/intellij/ &&
mv -v /tmp/intellij/idea*/* /usr/share/intellij/

#move the intellij settings on to the desktop for easy access
#mv -v /media/floppy0/intellij-scala-settings.jar /home/${OS_USERNAME}/Desktop/
echo "Copying the IntelliJ Scala settings and putting it on the desktop"
sudo -H -u ${OS_USERNAME} bash -c 'cp /media/floppy0/intellij-scala-settings.jar "$(xdg-user-dir DESKTOP)"'

echo "Granting access to the folder and subfolders so IntelliJ can be auto updated"
sudo chmod -R ugo+wrx /usr/share/intellij

#Creates the desktop launcher icon for intellij
echo "Creating Intellij Icon in Launcher"
printf '[Desktop Entry]\n Version=1.0\n Type=Application\n Name=IntelliJ IDEA Community Edition\n Icon=/usr/share/intellij/bin/idea.png\n Exec="/usr/share/intellij/bin/idea.sh" %f\n Comment=LLama Pants\n Catagories=Development;IDE;\n Terminal=false\n StartupWMClass=jetbrains-idea-ce' > '/usr/share/applications/jetbrains-idea.ce.desktop'
#########
#########


#Installing Docker
#########
echo "Installing Docker"
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
sudo apt-cache policy docker-engine
sudo apt-get install -y docker-engine

echo "Setting Docker so you dont have to sudo every time"
sudo usermod -aG docker ${OS_USERNAME}
#########

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
sudo -H -u ${OS_USERNAME} bash -c 'code --install-extension georgewfraser.vscode-javac'
#########

#Visual Studio Code - Fix Lancher
#########
echo "Fixing the VS Code Launcher Icon"
sed -i "s,Exec=/usr/share/code/code --unity-launch %U,Exec=/usr/share/code/code --disable-gpu --unity-launch %U,g" /usr/share/applications/code.desktop

#Make it the defualt editor
echo "Updating VS Code to be the defualt text editor"
sudo xdg-mime default code.desktop text/plain

#open /usr/share/applications/code.desktop
#replace  Exec=/usr/share/code/code --unity-launch %U
#with Exec=/usr/share/code/code --disable-gpu --unity-launch %U
#########
#########



#Install Kubectl
#########
#Download the kubectl
echo "Installing Kubectl"
sudo apt-get update
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
sudo apt-get update
#make it executable and move it to /bin
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#Add's auto correct to the ctl
echo "source <(kubectl completion bash)" >> ~/.bashrc
#########

#Install Azure CLI
#https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
#########
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main"
sudo tee /etc/apt/sources.list.d/azure-cli.list

sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
sudo apt-get install apt-transport-https
sudo apt-get update && sudo apt-get install azure-cli
#########


#Install Node.js (For Swagger Servers)
#########
echo "Installing Node.js"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
#########


#Install SBT (For Scala Builds)
#########
echo "Installing SBT"
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install -y sbt
#Compile the sbt under the vagrant user
sudo -H -u ${OS_USERNAME} bash -c 'sbt compile'
#########


#Install sqlite
#########
sudo apt-get install -y sqlite3
#########

#Customize the launcher icons
#########
#########
#Set Desktop Icons
echo "Setting Launcher Icons"
dbus-launch gsettings set com.canonical.Unity.Launcher favorites "['application://ubiquity.desktop', 'application://org.gnome.Nautilus.desktop' ,'application://firefox.desktop', 'application://gnome-terminal.desktop', 'application://jetbrains-idea.ce.desktop', 'application://code.desktop']"

echo "Allow Laucher to minimize"
dbus-launch gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

echo "Sets the menu so they always appear above the active window"
dbus-launch gsettings set com.canonical.Unity always-show-menus true
#########
#########




#http://unity-folders.exceptionfound.com/

#Install cleaner
#sudo add-apt-repository ppa:gerardpuig/ppa
#sudo apt-get update && sudo apt-get install ubuntu-cleaner

#Allow laucher to minimuze
#gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

#Sets the menus so they always appear above the active window
#gsettings set com.canonical.Unity always-show-menus true