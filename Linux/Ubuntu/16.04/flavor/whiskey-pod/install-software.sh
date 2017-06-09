#!/bin/sh -x

OS_USERNAME=${OS_USERNAME:-vagrant}

#Move the compiz profile to the desktop 
sudo mv /tmp/unity.profile /home/vagrant/Desktop/unity.profile


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

#sudo apt-get remove imagemagick

sudo apt-get clean
sudo apt-get autoremove

#Install Firewall
sudo apt-get install -y ufw 
sudo ufw allow ssh
sudo ufw allow http
#sudo ufw enable -y

					 
#Secure shared memory (need to update the root password first sudo passwd root vagrant vagrant)
sudo echo "# $TFCName Script Entry - Secure Shared Memory - $LogTime" >> /etc/fstab
sudo echo "tmpfs     /dev/shm     tmpfs     defaults,noexec,nosuid     0     0" >> /etc/fstab


#create auto start folder for variety
#sudo chown "vagrant":"vagrant" -R /home/vagrant/.config
sudo rm -r /home/vagrant/.config/autostart
mkdir /home/vagrant/.config/autostart

#Instll variety
sudo apt-get update
sudo apt-get install -y variety

#add the auto start to the dir
printf '[Desktop Entry]\nName=Variety\nComment=Variety Wallpaper Changer\nIcon=variety\nExec=variety\nTerminal=false\nType=Application\nX-GNOME-Autostart-Delay=20' > '/home/vagrant/.config/autostart/variety.desktop'
sudo chmod ugo+wrx /home/vagrant/.config/autostart/variety.desktop


#Install Httpie
sudo apt-get install -y httpie 

#Install the termainl
echo "Fixing terminal issues"
sed -i 's,LANG="en_US",LANG="en_US.UTF-8",g' /etc/default/locale
sed -i 's,LANGUAGE="en_US:",LANGUAGE="en_US",g' /etc/default/locale

#Install Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update 
sudo apt-get install -y google-chrome-stable

#Install dconf editor
sudo apt-get update
sudo apt-get install -y dconf-editor

#Compiz gui editor
sudo apt-get update
sudo apt-get install -y compizconfig-settings-manager

#Install topbar system monitor
sudo apt-get update
sudo apt-get install -y indicator-multiload
#start the indicator


##INSTALL JAVA8 from an install file rather than have the code here
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
#Install IntelliJ / Creates Launcher Icon / Add Auto Start on Login
#########
#########
echo "Installing IntelliJ"
wget -O /tmp/intellij.tar.gz https://download-cf.jetbrains.com/idea/ideaIC-2017.1.3.tar.gz &&
mkdir /tmp/intellij/ &&
tar xfz /tmp/intellij.tar.gz -C /tmp/intellij/ &&
mkdir /usr/share/intellij/ &&
mv -v /tmp/intellij/idea*/* /usr/share/intellij/

#Move the profile onto the desktop
mv -v /tmp/intellij-scala-settings.jar /home/${OS_USERNAME}/Desktop/

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
sudo -H -u ${OS_USERNAME} bash -c 'code --install-extension DotJoshJohnson.xml'
#########

#Visual Studio Code - Fix Lancher
#########
echo "Fixing the VS Code Launcher Icon"
sed -i "s,Exec=/usr/share/code/code --unity-launch %U,Exec=/usr/share/code/code --disable-gpu --unity-launch %U,g" /usr/share/applications/code.desktop

#Make it the defualt editor
echo "Updating VS Code to be the defualt text editor"
sudo xdg-mime default code.desktop text/plain
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
sudo apt-get update && sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main"
sudo tee /etc/apt/sources.list.d/azure-cli.list

sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y azure-cli
#########


#Install Node.js (For Swagger Servers)
#########
echo "Installing Node.js"
sudo apt-get update
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
sudo apt-get update
sudo apt-get install -y sqlite3
#########




#sudo python /tmp/set-compizconfig.py /tmp/compizconfig.profile


#Set Desktop Icons
echo "Setting Launcher Icons"
dbus-launch gsettings set com.canonical.Unity.Launcher favorites "['application://ubiquity.desktop', 'application://org.gnome.Nautilus.desktop' ,'application://firefox.desktop','application://google-chrome.desktop', 'application://gnome-terminal.desktop', 'application://jetbrains-idea.ce.desktop', 'application://code.desktop']"

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
dbus-launch gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 4
dbus-launch gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 4

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
dbus-launch gsettings set de.mh21.indicator-multiload.general color-scheme traditional
dbus-launch gsettings set de.mh21.indicator-multiload.general background-color traditional:background
dbus-launch gsettings set de.mh21.indicator-multiload.general autostart true

dbus-launch gsettings set de.mh21.indicator-multiload.graphs.cpu enabled true
dbus-launch gsettings set de.mh21.indicator-multiload.graphs.mem enabled true



sudo apt update && sudo apt upgrade -y


#disable guest login
sudo sh -c 'printf "[Seat:*]\nallow-guest=false\n" >/etc/lightdm/lightdm.conf.d/50-no-guest.conf'



#'application://firefox.desktop', 'application://gnome-terminal.desktop', 'application://jetbrains-idea.ce.desktop', 'application://code.desktop'
#['ubiquity.desktop', 'firefox.desktop', 'nautilus.desktop']
#['ubiquity.desktop', 'firefox.desktop', 'evolution.desktop', 'empathy.desktop', 'rhythmbox.desktop', 'org.gnome.Photos.desktop', 'libreoffice-writer.desktop', 'nautilus.desktop', 'yelp.desktop']

#sudo apt-get install gnome-tweak-tool
#sudo apt-get install chrome-gnome-shell

#sudo apt-get install gnome-shell


#install gnome termial
#sudo apt-get install gnome-terminal

#Firefox
#sudo apt-get install firefox
#sudo apt-get install mozilla-noscript

#sudo apt-get install dconf-editor


#Disable guest account
#Install following package

# apt-get install gksu

#Open Terminal and run following

# gksu gedit /etc/lightdm/lightdm.conf

#Add following lines

# [SeatDefaults]
#greeter-session=unity-greeter
#allow-guest=false

#Restart service

# sudo /etc/init.d/lightdm restart




#vagrant box add "C:\Users\autouser\Desktop\Packer_Templates-master\Linux\Ubuntu\16.04\.box\virtualbox\ub-16.04.02-64x-whiskey-pod.box" --name 01


