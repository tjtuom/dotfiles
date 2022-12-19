# INSTALL

## Shell
```
brew install fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

## Lunar VIM
```
brew install neovim
```

https://www.lunarvim.org/docs/installation

## Copy dotfiles

Run inside the directory
```
stow .
```
