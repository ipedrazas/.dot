all:
	ln -sf $(PWD)/vimrc $(HOME)/.vimrc
	ln -sf $(PWD)/vim $(HOME)/.vim
	# TODO: Check if this line exists
	echo ". $(PWD)/zsh" >> $(HOME)/.zshrc
	echo "%include $(PWD)/hg" >> $(HOME)/.hgrc
	ln -sf $(PWD)/terminator $(HOME)/.config
	ln -sf $(PWD)/gitconfig $(HOME)/.gitconfig
