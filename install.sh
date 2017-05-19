echo "Setting up your Mac..."

# Install Fresh

echo 'Installing Fresh'
bash -c '`curl -sL https://get.freshshell.com`'

echo 'Sourcing Fresh'
source ~/.fresh/build/shell.sh

echo 'Symlinking freshrc from dotfiles'
ln -s .dotfiles/freshrc .freshrc


# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo 'Installing Homebrew'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Add to startup
brew services start postgresql

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Setup Mac Preferences (requires reboot)

# Create a Code directory
mkdir $HOME/Code

# Add keyboard shortcuts
source macos/keyboard-shortcuts.sh

# All other settings
source macos/settings.sh
