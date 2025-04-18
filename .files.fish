#!/usr/bin/env fish

clear

set programs bat batman brew chruby eza git hx mise rg ruby-install starship wezterm zed zoxide

for p in $programs
	if not type -q $p
		echo dotfiles for or references to $p exist, but $p is not installed.
	end
end

if type -q rsync

    # bat

	rsync -av ~/.config/bat/config ~/c/.files/bat/

	# brewfile

	rsync -av ~/.config/Brewfile ~/c/.files/

	# Makes reference to Sublime Text, bat, batman, chruby-fish, emacsclient, eza, mise,
	# ripgrep (rg), ruby-install, starship, zoxide

	rsync -av ~/.config/fish/config.fish ~/c/.files/fish/

	# emacs config

	rsync -av ~/.config/emacs/early-init.el ~/c/.files/emacs/
	rsync -av ~/.config/emacs/init.el ~/c/.files/emacs/

	# git

	rsync -av ~/.config/git/config ~/c/.files/git/
	rsync -av ~/.config/git/.gitignore ~/c/.files/git/
	rsync -av ~/.config/git/.gitmessage ~/c/.files/git/

	# helix

	rsync -av ~/.config/helix/config.toml ~/c/.files/helix/
	rsync -av ~/.config/helix/languages.toml ~/c/.files/helix/

	# karabiner

	rsync -av ~/.config/karabiner/karabiner.json ~/c/.files/karabiner/

	# mise

	rsync -av ~/.config/mise/config.toml ~/c/.files/mise/

	# starship

	rsync -av ~/.config/starship.toml ~/c/.files/

	# wezterm

	rsync -av ~/.config/wezterm/wezterm.lua ~/c/.files/wezterm/
	rsync -av ~/.config/wezterm/colors/kanagawa-dragon.lua ~/c/.files/wezterm/colors/

	# zed

	rsync -av ~/.config/zed/settings.json ~/c/.files/zed/

else
	echo "This script requires rsync. https://rsync.samba.org"
end
