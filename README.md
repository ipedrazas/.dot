## Usage
Clone the repo and link the files in your $HOME path.

Example:

    cd $HOME;ln -s .dot/vimrc .vimrc

## Part configurations
Some files like zsh must be included in the normal .zshrc configuration file. For example:

### zsh
Add `. ~/.dot/zsh` at the end of your `~/.zshrc`.

### hg
Add `%include ~/.dot/hg` at the end of your `~/.hgrc`.

## vim notes
By default is configured to use ~/Documents/notes. You must create this path and a path called index inside:

    mkdir $HOME/Documents/notes/index -p
