# my config files for MacOS and Ubuntu

> Some useful Ubuntu_tools can be found in [Ubuntu_tools](Ubuntu_tools.md)

- [x] [tmux](./tmux/)
- [x] [zsh](./zsh/)
- [ ] [nvim](./vim/)

# Zsh
```
git clone https://github.com/zhuhu00/my_configs.git 
cp -r ./my_configs/zsh/. ~/
chsh -s $(which zsh)
```



one line command:
```sh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
sed -i '/^plugins=/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' ~/.zshrc && \
source ~/.zshrc
```
theme uses "ys"

```sh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

plugins=(git
    zsh-autosuggestions
    zsh-syntax-highlighting
    )

```


## Install zsh
`sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"`

## plugins
- zsh-autosuggestion
  `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
  - `~/.zshrc` update : `plugins=(zsh-autosuggestions)`
- zsh-syntax-highlighting, `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting`
  - `~/.zshrc` update : `plugins=(zsh-syntax-highlighting)`
  





# 显卡监控
gpustat 很好用
