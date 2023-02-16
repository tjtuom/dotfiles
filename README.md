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

## Yabai and SKHD

https://www.josean.com/posts/yabai-setup
```
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

brew services start yabai
brew services start skhd
```

## Copy dotfiles

Run inside the directory
```
stow .
```
