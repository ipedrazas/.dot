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
