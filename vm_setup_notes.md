After license installation, prior to MCUx and zsh...

1) Fix mouse back button (in .vmx file).
2) Grab .dotfiles (ssh://git@eng.plexus.com/~matt.stclair/dotfiles.git). Install stow (invoke as needed for config files).
3) Install i3 using the i3 Ubuntu repository (https://i3wm.org/docs/repositories.html).
4) Install Vundle: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim. Install vimrc and plugins.
5) Install FiraCode (git@github.com:tonsky/FiraCode.git).
6) Install kitty: curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin (https://sw.kovidgoyal.net/kitty/).
7) Install oh-my-zsh: sh -c "$(wget --no-check-certificate -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
8) Install p10k: git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

