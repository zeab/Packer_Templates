#Install Kubectl
#########
#Download the kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

#make it executable and move it to /bin
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#Add's auto correct to the ctl
echo "source <(kubectl completion bash)" >> ~/.bashrc
#########