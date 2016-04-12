<C-h> (CTRL-H) does not work in the new TUI
===========================================

To enable <C-h> in a neovim terminal split, you need to create the following symlink:

ln -s ~/dotfiles/terminfo ~/.terminfo
