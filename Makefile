all: help

install: 
		# Install Package Management Tool
		xcode-select --install
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

		# Install ZSH tools
		brew install zsh-completion brew-cask-completion zsh-syntax-highlighting

		# Install Development Environments
		brew install git composer docker docker-compose go  python telnet unzip wget yarn

		# Install GUI tools 
		brew install --cask docker google-chrome notion postman telegram iterm2 fork google-cloud-sdk phpstorm goland tableplus brave-browser
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

		# Install Fonts
		brew tap homebrew/cask-fonts
		brew cask install font-fira-code font-fira-mono-for-powerline

		# Reload .zsh setting
		cp ~/.zshrc ~/.zshrc.bkup
		curl -fsSL raw.githubusercontent.com/khjay/mac-install-note/master/.zshrc -o ~/.zshrc

		# Install ZSH Custom Plugins
		git clone https://github.com/zsh-users/zsh-autosuggestions $(HOME)/.oh-my-zsh/custom/plugins/autosuggestions
		rm -f ~/.zcompdump; compinit
		chmod go-w '/usr/local/share'
		source $(HOME)/.zshrc


.PHONY: help

help: 
	@echo "help..."

brew-bundle-dump:
	brew bundle dump --describe --force --file="./Brewfile"
brew-install:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install mas
brew-bundle-install: 
	brew bundle --file="./Brewfile"

commit-push:
	git add . && git commit -m "$(msg)" && git push

install-alias:
	echo "source $(PWD)/zalias" >> ~/.zshrc