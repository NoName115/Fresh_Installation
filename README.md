# Ubuntu_Installation
* Disk encryption
	* https://www.maketecheasier.com/encrypt-hard-disk-in-ubuntu/

### Wis-certificate
* CRT version
	* https://ca.vutbr.cz/cgi-bin/pki/pub/pki?cmd=getStaticPage
* Installation
	* http://ca.vutbr.cz/pki/pub/unix3.html

### VS Code
* https://code.visualstudio.com/docs/setup/linux
* Extentions
	* Python
	* LaTeX Workshop
```
code --install-extension ms-python.python
code --install-extension James-Yu.latex-workshop
code --install-extension WakaTime.vscode-wakatime
code --install-extention bierner.markdown-preview-github-styles

cp settings.json ~/.config/Code/User/
```

### Chromium
```
sudo apt-get install chromium-browser
```

### LaTeX
* 4Gb
```
sudo apt-get install texlive-full
```

### Python3 - pip3
```
sudo apt-get install python3-dev
sudo pip3 install ...
sudo apt-get install python-virtualenv python3-venv
```

### Java
```
sudo apt-get install openjdk-8-jdk
```

### Other
```
sudo apt-get install vim
sudo apt-get install git
sudo apt-get install gcc
sudo apt-get install python3-tk
```

### Bachelor thesis
```
python3 -m venv virenv
source virenv/bin/activate
pip install html5lib
pip install numpy
pip install --upgrade tensorflow
pip install keras
pip install scikit-learn
pip install imutilsi
pip install opencv-python
pip install hp5
```

### Grub customizer
```
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install grub-customizer
```

### Music player
VLC vs. Rhythmbox



# Fedora installation
* Tutorial
	* https://docs.fedoraproject.org/f27/install-guide/install/Installing_Using_Anaconda.html

### Other
* Add English/Slovak keyboard
* Add shortcut Ctrl+Alt+T for gnome-terminal
* Download SSH-keys
* Polari, Chromium
```
dnf install vim
```

### GitHub
```
dnf install git
git config --global user.name "NoName115"
git config --global user.email "robert.kolcun@gmail.com"
```

### VS Code
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install code
```

### Python3, pip3
```
dnf install python3-devel
dnf install python3-tkinter
pip3 install matplotlib
pip3 install numpy
pip3 install prettytable
pip3 install zxcvbn-python
```
