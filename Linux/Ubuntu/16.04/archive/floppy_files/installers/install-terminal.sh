#Terminal - Fix Lang Issues
#########
#Not actually installing terminal here just fixing it so that it works

#edit /etc/defualt/locale
#change the two lines so they read correctly
sed -i 's,LANG="en_US",LANG="en_US.UTF-8",g' /etc/default/locale

sed -i 's,LANGUAGE="en_US:",LANGUAGE="en_US",g' /etc/default/locale
#########