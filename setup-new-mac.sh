#!/bin/bash

# Inspiration here: https://gist.github.com/t-io/8255711
# Thanks to https://gist.github.com/gazzwi86 for showing me this script

echo 'Install all AppStore Apps at first!'
# echo 'Check the list of useful apps: https://gist.github.com/gazzwi86/75d87afc1fe44a5f5d84'
read -p "Press any key to continue... " -n1 -s
echo '\n'

echo 'setup xcode'
xcode-select --install

echo 'show file extentions and re-start finder'
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
killall Finder

echo 'source bash profile'
echo 'if [ -f ~/.bash_profile ]; then . ~/.bash_profile; fi)' >> ~/.bash_profile

echo 'Setup oh my zsh'
brew install zsh zsh-completions
echo "fpath=(/usr/local/share/zsh-completions $fpath)" >> ~/.zshrc
rm -f ~/.zcompdump; compinit
perl -i -pe 's/plugins=\(git\)/plugins=\(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting\)/g' ~/.zshrc

echo 'Setup homebrew and yarn'
brew install node
npm install -g yarn

echo 'Install NVM'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

echo 'Setup docker'
brew cask install docker
brew cask install virtualbox

echo 'Setup sass'
sudo gem install sass

echo 'Setup quickview'
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook quicklookase qlvideo

echo 'Instal IDE and extensions'
brew cask install --appdir="/Applications" visual-studio-code
# code --install-extension ms-vscode.atom-keybindings
# code --install-extension peterjausovec.vscode-docker
# code --install-extension waderyan.gitblame
# code --install-extension davidanson.vscode-markdownlint
# code --install-extension eg2.vscode-npm-script
# code --install-extension christian-kohler.npm-intellisense
# code --install-extension wallabyjs.quokka-vscode
# code --install-extension vsmobile.vscode-react-native
# code --install-extension asvetliakov.snapshot-tools
# code --install-extension shinnn.stylelint
# code --install-extension wix.vscode-import-cost
# code --install-extension humao.rest-client
# code --install-extension kumar-harsh.graphql-for-vscode

code --install-extension formulahendry.auto-close-tag
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension baeumer.vscode-eslint
code --install-extension donjayamanne.githistory
code --install-extension formulahendry.auto-rename-tag
code --install-extension hookyqr.beautify
code --install-extension waderyan.gitblame
code --install-extension oderwat.indent-rainbow
code --install-extension sirtori.indenticator
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension ms-vscode.vscode-typescript-tslint-plugin

# User settings in use:
# {
#     "window.zoomLevel": -1,
#     "window.nativeTabs": true,
#     "editor.formatOnPaste": false,
#     "editor.tabSize": 2,
#     "liveshare.featureSet": "insiders",
#     "editor.scrollBeyondLastLine": false,
#     "[javascript]": {
#           "editor.defaultFormatter": "HookyQR.beautify"
#      },
# }

echo 'Install applications'
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" whatsapp
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" spotify-notifications
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" divvy
brew cask install --appdir="/Applications" macdown
brew cask install --appdir="/Applications" blingedjsonvalidator
brew cask install --appdir="/Applications" filezilla
brew cask install --appdir="/Applications" teamviewer

### https://www.spectacleapp.com/

echo 'Clean brew cache'
brew cleanup --force

echo "For security suggestions see: https://objective-see.com/products.html"