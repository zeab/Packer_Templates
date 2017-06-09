This is an easy button to bring up a network accessable kafka que

place this vagrant file in your dir of choice

open a command promt in that dir

run command "vagrant up"

once running ssh in and grab the ip address

you should now be able to hit your new kafka virtual machine

You will need to change the bridgedadapter2 to the name of your local ethernet conenction (you can find this by looking at the bridged network setting and just copy the name of whatever adapter you looking to use) 