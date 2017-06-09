#Install IntelliJ / Creates Launcher Icon / Add Auto Start on Login
#########
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
printf '[Desktop Entry]\n Version=2017.1\n Type=Application\n Name=IntelliJ IDEA Community Edition\n Icon=/usr/share/intellij/bin/idea.png\n Exec="/usr/share/intellij/bin/idea.sh" %f\n Comment=The Drive to Develop\n Catagories=Development;IDE;\n Terminal=false\n StartupWMClass=jetbrains-idea-ce' > '/usr/share/applications/jetbrains-idea.ce.desktop'
#########
#########