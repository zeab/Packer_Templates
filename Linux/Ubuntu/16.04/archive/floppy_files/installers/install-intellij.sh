#install IntelliJ
wget -O /tmp/intellij.tar.gz http://download.jetbrains.com/idea/ideaIC-12.0.4.tar.gz &&
tar xfz /tmp/intellij.tar.gz &&
cd idea-IC-123.169/bin &&
./idea.sh
#need to add the shortcut to the menu but it seems to work

#copy the file from floppy to the below location
mv a:/installers/intellij.desktop /usr/share/applications/intellij.desktop

#// mod permissions
sudo chmod 644 /usr/share/applications/intellij.desktop
sudo chown root:root /usr/share/applications/intellij.desktop




#// create file:
#sudo vim /usr/share/applications/intellij.desktop

#// add the following
#[Desktop Entry]
#Version=13.0
#Type=Application
#Terminal=false
#Icon[en_US]=/home/rob/.intellij-13/bin/idea.png
#Name[en_US]=IntelliJ
#Exec=/home/rob/.intellij-13/bin/idea.sh
#Name=IntelliJ
#Icon=/home/rob/.intellij-13/bin/idea.png