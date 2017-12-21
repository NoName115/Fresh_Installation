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
sudo pip3 install ...
```

### Java
```
sudo apt-get install openjdk-8-jdk
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

### VS Code
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install code
```
