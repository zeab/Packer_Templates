echo "IntelliJ Software Install"

#THIS IS THE PATH TO THE FLOPPY FILES!!! When ubuntu boots at least. 
#/media/floppy0


#Attept at using enviroment variables ... unused at the moment
FLOPPY_FILE_PATH=${FLOPPY_FILE_PATH:-vagrant}

#Terminal - Fix Lang Issues
#########
#Not actually installing terminal here just fixing it so that it works
#edit /etc/defualt/locale
#change the two lines so they read correctly
sed -i 's,LANG="en_US",LANG="en_US.UTF-8",g' /etc/default/locale
sed -i 's,LANGUAGE="en_US:",LANGUAGE="en_US",g' /etc/default/locale
#########

#Install 7zip (becuase 7zip is awesome)
#########
#sudo apt-get install -y p7zip-full
#########


#Install Java8
#########
echo "Installing Java 8"
apt-get update
apt-get install -y  software-properties-common
add-apt-repository ppa:webupd8team/java -y
apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install -y oracle-java8-installer
#########


#Install IntelliJ / Creates Launcher Icon / Add Auto Start on Login
#########
echo "Installing IntelliJ"
wget -O /tmp/intellij.tar.gz https://download-cf.jetbrains.com/idea/ideaIC-2017.1.tar.gz &&
mkdir /tmp/intellij/ &&
tar xfz /tmp/intellij.tar.gz -C /tmp/intellij/ &&
mkdir /usr/share/intellij/ &&
mv -v /tmp/intellij/idea*/* /usr/share/intellij/

#Creates the desktop launcher icon for intellij
echo "Creating Intellij Icon in Launcher"
#printf '[Desktop Entry] \nVersion=2017.1 \nType=Application \nTerminal=false \nIcon[en_US]=/usr/share/intellij/bin/idea.png \nName[en_US]=IntelliJ \nExec=/usr/share/intellij/bin/idea.sh \nName=IntelliJ \nIcon=/home/intellij/bin/idea.png'  > '/usr/share/applications/intellij.desktop'
printf '[Desktop Entry]\n Version=1.0\n Type=Application\n Name=IntelliJ IDEA Community Edition\n Icon=/usr/share/intellij/bin/idea.png\n Exec="/usr/share/intellij/bin/idea.sh" %f\n Comment=The Drive to Develop\n Catagories=Development;IDE;\n Terminal=false\n StartupWMClass=jetbrains-idea-ce' > '/usr/share/applications/jetbrains-idea.ce.desktop'

#Add it to auto start on login
#echo "Adding IntelliJ to autostart on login"
#echo "Making the autostart directory... or is this already defined with the desktop reboot...although it cant be"
#mkdir '/home/vagrant/.config/autostart/' 
#echo "Creating Desktop Entry .desktop file"
#printf '[Desktop Entry] \nType=Application \nExec=/usr/share/intellij/bin/idea.sh \nName=IntelliJ \nComment='  > '/home/vagrant/.config/autostart/intellij.desktop'
#########


#Scala Plugin Install to IntelliJ
wget -O /tmp/scala-intellij-bin.zip https://plugins.jetbrains.com/files/1347/33637/scala-intellij-bin-2017.1.15.zip
unzip /tmp/scala-intellij-bin.zip -d /usr/share/intellij/config/plugins/scala-intellij-bin

#Customize the launcher icons
#########
#Set Desktop Icons
dbus-launch gsettings set com.canonical.Unity.Launcher favorites "['application://firefox.desktop', 'application://gnome-terminal.desktop', 'application://jetbrains-idea.ce.desktop']"
#########

#exit 0


#reboot into GUI mode
#reboot



#Scala plugins
#wget -O /tmp/scala-intellij-bin.tar.gz https://plugins.jetbrains.com/scala-intellij-bin-2017.1.15.zip &&
#tar xfz /tmp/scala-intellij-bin.tar.gz -C /usr/share/intellij/config/plugins/scala-intellij-bin
