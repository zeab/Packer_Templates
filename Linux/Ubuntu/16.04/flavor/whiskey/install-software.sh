#!/bin/sh -x

#Set Env Vars
#########
OS_USERNAME=${OS_USERNAME:-vagrant}
#########

#Begin clean-up phase

#########
echo "**********Uninstall Software bloat**********"

#Unisntall Thunderbird
sudo apt-get purge -y --auto-remove thunderbird

#Some photo thing
sudo apt-get purge -y --auto-remove cheese

#The offie suite
sudo apt-get purge -y --auto-remove libreoffice*

#The regular packaged web browser
sudo apt-get purge -y --auto-remove webbrowser-app

#Some photo manager
sudo apt-get purge -y --auto-remove shotwell

#Uninstall games
sudo apt-get purge -y --auto-remove aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy

#The music player
sudo apt-get purge -y --auto-remove rhythmbox

#The packaged video player that comes with gnome
sudo apt-get purge -y --auto-remove totem totem-plugins

#Some tablet softwares
sudo apt-get purge -y --auto-remove xserver-xorg-input-wacom wacom-tools

#removes xdiagnoese
sudo apt-get purge -y --auto-remove xdiagnose

#removes simple scan
sudo apt-get purge -y --auto-remove simple-scan

#get rid of the stupid overlay scroll bar
sudo apt-get purge -y --auto-remove overlay-scrollbar

#xterm
#sudo apt-get purge -y --auto-remove xterm

#transmission
sudo apt-get purge -y --auto-remove transmission-gtk

#telnet since why would we need that?
sudo apt-get purge -y --auto-remove telnet

#ubuntu software center
sudo apt-get purge -y --auto-remove ubuntu-software

#weather
sudo apt-get purge -y --auto-remove libgweather*

#baobab
#sudo apt-get purge -y --auto-remove baobab

#imagejack
#sudo apt-get remove imagemagick

#final clean up
sudo apt-get clean
sudo apt-get autoremove
#########

#End clean-up phase

#Install the termainl
#########
echo "Fixing terminal issues"
sed -i 's,LANG="en_US",LANG="en_US.UTF-8",g' /etc/default/locale
sed -i 's,LANGUAGE="en_US:",LANGUAGE="en_US",g' /etc/default/locale
#########

#Install Terminator
#########
echo "**********Install Terminator**********"
sudo apt-get update && sudo apt-get install -y terminator 
#########

#Install Httpie
#########
echo "**********Install Httpie**********"
sudo apt-get update && sudo apt-get install -y httpie 
#########

#Install Jq
#########
echo "**********Install Jq**********"
sudo apt-get update && sudo apt-get install -y jq
#########

#Install Zip/Unzip
#########
echo "**********Install Zip/Unzip**********"
sudo apt-get update && sudo apt-get install -y zip unzip
#########

#Install Curl
#########
echo "**********Install Curl**********"
sudo apt-get update && sudo apt-get install -y curl
#########

#Install Htop
#########
echo "**********Install Htop**********"
sudo apt-get update && sudo apt install htop
#########

#Install Nano
#########
echo "**********Install Nano**********"
sudo apt-get update && sudo apt-get install -y nano
#########

#Install the wall paper ive chosen
#########
wget -O /tmp/wall_paper.zip https://github.com/zeab/wall-paper-favorites/archive/master.zip
unzip /tmp/wall_paper.zip -d /tmp/wall_paper/
sudo mv /tmp/wall_paper/wall-paper-favorites-master/* /usr/share/backgrounds
#########

#Instll variety
#########
echo "**********Install Variety**********"
sudo apt-get update && sudo apt-get install -y variety
#add the auto start to the dir
printf '[Desktop Entry]\nName=Variety\nComment=Variety Wallpaper Changer\nIcon=variety\nExec=variety\nTerminal=false\nType=Application\nX-GNOME-Autostart-Delay=20' > '/home/vagrant/.config/autostart/variety.desktop'
sudo chmod ugo+wrx /home/vagrant/.config/autostart/variety.desktop
#########

#Install Chrome
#########
echo "**********Instal Chrome**********"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update && sudo apt-get install -y google-chrome-stable
#########

#Install Postman
#########
echo "**********Instal Postman**********"
wget -O /tmp/postman.tar.gz https://dl.pstmn.io/download/latest/linux64 
sudo tar -xzf /tmp/postman.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/bin/postman
printf '[Desktop Entry]\nEncoding=UTF-8\nName=Postman\nComment=Http Rest Client\nIcon=variety\nExec=postman\nIcon=/opt/Postman/resources/app/assets/icon.png\nTerminal=false\nType=Application\nCategories=Development' > '/tmp/postman.desktop'
sudo mv /tmp/postman.desktop /usr/share/applications/
#########

#Install dconf editor
#########
echo "**********Install Dconf**********"
sudo apt-get update && sudo apt-get install -y dconf-editor
#########

#Compiz gui editor
#########
echo "**********Install Compiz Editor**********"
sudo apt-get update &&  sudo apt-get install -y compizconfig-settings-manager
#########

#Install topbar system monitor
#########
echo "**********Install Indicator-Multiload**********"
sudo apt-get update && sudo apt-get install -y indicator-multiload
#start the indicator
#sudo dbus-launch indicator-multiload
#########

#install fly cli
#echo "**********Install FlyCLI**********"
#wget -O /tmp/fly https://github.com/concourse/concourse/releases/download/v3.5.0/fly_linux_amd64
#mkdir /usr/share/fly
#mv -v /tmp/fly /usr/share/fly/fly
#chmod +x /usr/share/fly/fly
#add to paths
#sudo printf "export PATH=/usr/share/fly" >> /home/vagrant/.profile

#Install Kafka
#########
echo "**********Install Kafka**********"
#download kafka
#wget -O /tmp/kafka.tar.gz http://www-us.apache.org/dist/kafka/0.11.0.0/kafka_2.12-0.11.0.1.tgz
#unzip from tmp to usr/share
#tar xfz /tmp/kafka.tar.gz -C /usr/share/
#make new kafka dir
#mkdir /usr/share/kafka/
#move the interior unziped folder to new versionless kafka 
#mv /usr/share/kafka*/* /usr/share/kafka
#remove the old folder
#rm -r /usr/share/kafka_2.12-0.11.0.1
#give that folder excution rights
#sudo chmod -R +x /usr/share/kafka/bin
#add to paths
#sudo echo "export PATH=$PATH:/usr/share/kafka/bin" >> /home/vagrant/.profile
#sed -i 's,PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games",PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/share/fly:/usr/share/kafka/bin",g' /etc/environment
#########

#Install Java8
#########
echo "**********Install OpenJDK 8**********"
sudo apt-get update && sudo apt-get install -y openjdk-8-jdk
#########

#Install IntelliJ
#########
echo "**********Install IntelliJ**********"
wget -O /tmp/intellij.tar.gz https://download.jetbrains.com/idea/ideaIC-2017.2.6.tar.gz &&
mkdir /tmp/intellij/ &&
tar xfz /tmp/intellij.tar.gz -C /tmp/intellij/ &&
mkdir /usr/share/intellij/ &&
mv -v /tmp/intellij/idea*/* /usr/share/intellij/

#Grant rights to the files for updating purposes
echo "Granting access to the folder and subfolders so IntelliJ can be auto updated"
sudo chmod -R ugo+wrx /usr/share/intellij

#Creates the desktop launcher icon for intellij
echo "Creating Intellij Icon in Launcher"
printf '[Desktop Entry]\n Version=1.0\n Type=Application\n Name=IntelliJ IDEA Community Edition\n Icon=/usr/share/intellij/bin/idea.png\n Exec="/usr/share/intellij/bin/idea.sh" \n Comment=LLama Pants\n Catagories=Development;IDE;\n Terminal=false\n StartupWMClass=jetbrains-idea-ce' > '/usr/share/applications/jetbrains-idea.ce.desktop'
#########

#find the   <component name="GeneralSettings">
#instrt the line one down
#    <option name="reopenLastProject" value="false" />

#change the settings so projects dont auto open
#/home/vagrant/.IdeaIC2017.1/config/options
#/home/vagrant/.IdeaIC2017.1/config/options

#Install Golang
#########
wget -O /tmp/go.tar.gz https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz
tar xfz /tmp/go.tar.gz -C /tmp/
sudo mv -v /tmp/go/ /home/vagrant/go/
printf "\nexport PATH=\$PATH:/home/vagrant/go/bin" >> /home/vagrant/.profile
#########

#Install Atom
#########
echo "**********Install Atom**********"
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update && sudo apt install -y atom

#sudo apm install go-debug
#sudo apm install go-plus
#sudo apm install hyperclick
#sudo apm install go-signature-statusbar
#sudo apm install linter
#sudo apm install linter-ui-default
#sudo apm install intentions 
#sudo apm install busy-signal
#/usr/share/go/bin/go get -u github.com/derekparker/delve/cmd/dlv

#echo "**********Setting Atom as defualt text editor**********"
#sudo xdg-mime default atom.desktop text/plain
#########

#Install VS Code
#########
echo "**********Install VS Code**********"
#sudo -H -u ${OS_USERNAME} bash -c  'sudo snap install --classic vscode'
wget -O /tmp/code.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i /tmp/code.deb
sudo apt-get update && sudo apt-get install code
echo "Installing VS Code Extentions"
#sudo -H -u ${OS_USERNAME} bash -c 'code --install-extension donjayamanne.python'
sudo -H -u ${OS_USERNAME} bash -c 'code --install-extension PeterJausovec.vscode-docker'
#sudo -H -u ${OS_USERNAME} bash -c 'code --install-extension georgewfraser.vscode-javac'
sudo -H -u ${OS_USERNAME} bash -c 'code --install-extension DotJoshJohnson.xml'
sudo xdg-mime default code.desktop text/plain
#########

#Installing Docker
#########
echo "**********Install Docker**********"
sudo apt-get update && sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update && sudo apt-get install -y docker-ce
#Set docker as part of the user group   
sudo usermod -aG docker ${OS_USERNAME}
#Start and autostart the docker service
sudo systemctl start docker
sudo systemctl enable docker
#########

#VisualVM
#########
echo "**********Install VisualVM**********"
wget -O /tmp/visualvm.zip https://github.com/visualvm/visualvm.src/releases/download/1.3.9/visualvm_139.zip
mkdir /tmp/visualvm/
unzip /tmp/visualvm.zip -d /tmp/visualvm/
sudo mkdir /usr/share/visualvm/
sudo mv -v /tmp/visualvm/visualvm*/* /usr/share/visualvm/
chmod +x /usr/share/visualvm/bin/./visualvm
sudo printf '[Desktop Entry]\nName=VisualVM\nComment=All-in-One Java Troubleshooting Tool\nKeywords=java;jvm;profiler;monitoring\nExec=/usr/share/visualvm/bin/visualvm\nIcon=/usr/share/visualvm/etc/visualvm.icns\nCategories=Development;Java;\nTerminal=false\nType=Application' > '/usr/share/applications/visualvm.desktop'
#########

#Install Kubectl
#########
#Download the kubectl
#echo "**********Instal Kubectl**********"
#curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
#make it executable and move it to /bin
#chmod +x ./kubectl
#sudo mv ./kubectl /usr/local/bin/kubectl

#Add's auto correct to the ctl
#echo "source <(kubectl completion bash)" >> ~/.bashrc
#########

#Install Azure CLI
#https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
#########
#sudo apt-get update && sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
#echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main"
#sudo tee /etc/apt/sources.list.d/azure-cli.list

#sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
#sudo apt-get install -y apt-transport-https
#sudo apt-get update
#sudo apt-get install -y azure-cli
#########

#Install Node.js (For Swagger Servers)
#########
echo "**********Install Node.js**********"
wget -O /tmp/nodejs.sh https://deb.nodesource.com/setup_6.x
sudo bash nodejs.sh
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
#########

#Install SBT
#########
echo "**********Install Sbt**********"
wget -O /tmp/sbt.deb http://dl.bintray.com/sbt/debian/sbt-1.0.4.deb
sudo dpkg -i /tmp/sbt.deb
sudo apt-get update && sudo apt-get install sbt
sudo -H -u ${OS_USERNAME} bash -c 'sbt compile'
#########

#Install Sqlite
#########
echo "**********Install Sqlite**********"
sudo apt-get update && sudo apt-get install -y sqlite3
#########

#Move the compiz profile to the desktop 
echo "Getting Github floppy files"
wget -O /tmp/floppy_files.zip https://github.com/zeab/Packer_Floppy_Files/archive/master.zip
unzip /tmp/floppy_files.zip -d /tmp/floppy_files/
sudo mv /tmp/floppy_files/Packer_Floppy_Files-master/whiskey/unity.profile /home/vagrant/Desktop/unity.profile


echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "**********Modifications Are Safe*****************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "**********Modifications Are Safe*****************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "**********Modifications Are Safe*****************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"
echo "*************************************************"

#Allow for some clean up and manual intervention at the end
echo "Sleeping 10 min for pictures"
sleep 5m
echo "5 min left"
sleep 4m
echo "1 min left"
sleep 30s
echo "30 seconds left"
sleep 15s
echo "15 seconds left"
sleep 15s


#Set Desktop Icons
echo "Setting Launcher Icons"
dbus-launch gsettings set com.canonical.Unity.Launcher favorites "['application://ubiquity.desktop', 'application://org.gnome.Nautilus.desktop', 'application://terminator.desktop', 'application://google-chrome.desktop', 'application://jetbrains-idea.ce.desktop', 'application://code.desktop', 'application://visualvm.desktop', 'application://postman.desktop']"
#'application://atom.desktop', 'application://firefox.desktop'

#Sets the buttons on the right and correct widnows (So the ubuntu desktop people are dick's and decided everyone should have the buttons in the same place the same way so there is no option to change it)
#dbus-launch gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

#Sets the windows to minimize when clicked inthe launcher like in windows
dbus-launch gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

#Set up the grid the way i like it (These settings dont get set till )
#gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/test/ 
#dbus-launch gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/grid/ bottom-edge-action 2
#dbus-launch gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/grid/ bottom-left-edge-action 1
#dbus-launch gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/grid/ bottom-edge-action 3
#dbus-launch gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/grid/ top-edge-action 8
#dbus-launch gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/grid/ top-left-edge-action 7
#dbus-launch gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/grid/ top-edge-action 9


#enable workspaces
dbus-launch gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
dbus-launch gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2

#always show the window menu
dbus-launch gsettings set com.canonical.Unity always-show-menus true

#attach the menu to the window
dbus-launch gsettings set com.canonical.Unity integrated-menus true

#remove sound from task bar
dbus-launch gsettings set com.canonical.indicator.sound visible false

#change and set time stuff
dbus-launch gsettings set com.canonical.indicator.datetime show-day true
dbus-launch gsettings set com.canonical.indicator.datetime time-format "24-hour"
sudo timedatectl set-timezone America/Los_Angeles

#always show the location in the file systme
dbus-launch gsettings set org.gnome.nautilus.preferences always-use-location-entry true 

#enable recursive searching
dbus-launch gsettings set org.gnome.nautilus.preferences enable-interactive-search false

#Multiload indicators
dbus-launch gsettings set de.mh21.indicator-multiload.general width 100
#dbus-launch gsettings set de.mh21.indicator-multiload.general background-color 'traditional:background'
#dbus-launch gsettings set de.mh21.indicator-multiload.general color-scheme 'traditional'

dbus-launch gsettings set de.mh21.indicator-multiload.graphs.cpu enabled true
dbus-launch gsettings set de.mh21.indicator-multiload.graphs.mem enabled true
dbus-launch gsettings set de.mh21.indicator-multiload.graphs.net enabled true

#set up 2nd network card
echo "Enable 2nd network card for brdiged connections"
printf "\nauto enp0s8\niface enp0s8 inet dhcp" >> /etc/network/interfaces

#Final update and upgrade
sudo apt update && sudo apt upgrade -y

#disable guest login
sudo sh -c 'printf "[Seat:*]\nallow-guest=false\n" >/etc/lightdm/lightdm.conf.d/50-no-guest.conf'