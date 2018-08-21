# dotconfig
Contains configuration for following programs:
* xfce4-terminal
* zsh
* fzf
* tmux
* vim

## installation
```bash
mkdir ~/.config
cd ~/.config
git init .
git remote add origin https://github.com/i-sinister/dotconfig
git pull
git pull origin master
cd ~
```
### zsh
To make zsh default shell run ````sudo -s chsh $(which zsh) ```` then logout and login again.
```Bash
~/.config/zsh/install.sh
```
### tmux
```Bash
~/.config/tmux/install.sh
```
### vim
Uses Plug for plugin management
```Bash
~/.config/vim/install.sh
```
Then open vim and run ```PlugInsall```
