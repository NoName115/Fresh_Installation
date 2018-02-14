#!/bin/bash

SSHKEYSFILE='ssh_keys.link'
SSHKEYSZIP='ssh_keys.zip'

# ---------- PLATFORM -------------
# Get type of OS - Fedora/Ubuntu
OS=$(lsb_release -a | sed -n '2,2p' | awk '{print $2}')

# Check platform
if [ $OS == 'Ubuntu' ] || [ $OS == 'Fedora' ]; then
	echo "------------------"
	echo "--- [PLATFORM] ---"
	echo -e "----- $OS -----\n"
else
	echo "Unsupported OS"
	exit
fi

# ----------- SSH KEYS ------------- 
read -p "Download & copy ssh keys? (y/n) " choice
if [ "$choice" = "y" ]; then
	echo "-------------------"
	echo "---- [SSHKEYS] ----"
	echo -e "-------------------\n"
	
	# Download and copy ssh-keys
	# First line Ubuntu, Second line Fedora
	if [ $OS == "Ubuntu" ]; then
		wget $(cat $SSHKEYSFILE | head -1 | awk '{print $2}')
	else
		wget $(cat $SSHKEYSFILE | tail -1 | awk '{print $2}')
	fi

	# SSH keys rename, unzip & move
	mv $(ls | grep 'uc?') $SSHKEYSZIP
	unzip $SSHKEYSZIP
	#mv .ssh/* ~/

	# Remove
	rm $SSHKEYSZIP
else
	echo "Skipped."
fi

# ----------- Git config -------------
git config --global user.name "NoName115"
git config --global user.email "robert.kolcun@gmail.com"

# ----------- VS Code -------------
echo "-------------------"
echo "---- [VS Code] ----"
echo -e "-------------------\n"

read -p "Download & install VS Code? (y/n) " choice
if [ "$choice" = "y" ]; then
	if [ $OS == 'Ubuntu' ]; then
		curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
		sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
		sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
		sudo apt-get update
		sudo apt-get install code
	else
		sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
		sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
		sudo dnf check-update
		sudo dnf install code
	fi

	# Extentions
	code --install-extension ms-python.python
	code --install-extension James-Yu.latex-workshop
	code --install-extension WakaTime.vscode-wakatime
	code --install-extention bierner.markdown-preview-github-styles

	# Copy settings
	#cp settings.json ~/.config/Code/User/
else
	echo "Skipped."
fi

# ----------- Python3 -------------
echo "-------------------"
echo "---- [Python3] ----"
echo -e "-------------------\n"
if [ $OS == 'Ubuntu' ]; then
	echo 'NIE'
	sudo apt-get install python3-dev python3-venv python3-tk
	echo 'TU'
else
	sudo dnf install python3-devel python3-venv python3-tkinter
fi

read -p "Download & install packages for bachelor thesis? (y/n) " choice
if [ "$choice" = "y" ]; then
	git clone git@github.com:NoName115/BP.git ~/BP
	python3 -m venv ~/BP/virenv
	source ~/BP/virenv/bin/activate
	pip install html5lib numpy
	pip install --upgrade tensorflow
	pip install keras scikit-learn imutils opencv-python hp5
else
	echo "Skipped."
fi


read -p "Download & install packages for pcl-analyzer? (y/n) " choice
if [ "$choice" = "y" ]; then
	git clone git@github.com:redhat-qe-security/pcl-analyzer.git ~/pcl-analyzer
	pip3 install matplotlib numpy prettytable zxcvbn-python
else
	echo "Skipped."
fi


# ----------- Other -------------
echo "-------------------"
echo "----- [Other] -----"
echo -e "-------------------\n"
if [ $OS == 'Ubuntu' ]; then
	sudo apt-get install chromium-browser
	sudo apt-get install vim
	sudo apt-get install gcc

	read -p "Install LaTeX packages? (y/n) " choice
	if [ "$choice" = "y" ]; then
		sudo apt-get install texlive-full
	else
		echo "Skipped."
	fi
	
	read -p "Install Grub customizer? (y/n) " choice
	if [ "$choice" = "y" ]; then
		sudo add-apt-repository ppa:danielrichter2007/grub-customizer
		sudo apt-get update
		sudo apt-get install grub-customizeri
	else
		echo "Skipped."
	fi
else
	dnf install vim
	dnf install gcc
fi

echo "---- [END] ----"

