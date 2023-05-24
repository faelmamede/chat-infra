echo -e "\n\n ------- Updating package list from all PPA repositories ------- \n"
sudo apt-get update

echo -e "\n\n ------ Installing Ansible -------- \n"
sudo apt-get install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update && sudo apt-get -y install ansible

echo -e "\n\n************ Running Ansible Playbooks *********** \n\n"

echo -e "\n\n************ Installing ubuntu dependecies by [dependencies.yml] *********** \n"
ansible-playbook dependencies.yml

echo -e "\n\n************ Installing docker-ce on VMs by [docker.yml] *********** \n"
ansible-playbook docker.yml

echo -e "\n\n*********** Creating cluster by [cluster.yml] ********** \n"
ansible-playbook cluster.yml

echo -e "\n\n*********** Deploying docker registry by [registry.yml] ********** \n"
ansible-playbook registry.yml

echo -e "\n\n************ Running up docker-visualizer container by [visualizer.yml] ************ \n"
ansible-playbook visualizer.yml

echo -e "\n\n************ Installing NodeJS and NPM by [node.yml] ************ \n"
ansible-playbook node.yml

echo -e "\n\n************ Start Chat Server and Login Interface [server.yml] ************ \n"
ansible-playbook server.yml