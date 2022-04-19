#!/usr/bin/env bash

# gen:problem:path
var_nvim_packer_path=/home/$USER/.local/share/nvim/site/pack/packer
# local:problem:path
var_start_dir_path="$var_nvim_packer_path"/start
var_opt_dir_path="$var_nvim_packer_path"/opt

# working directories' backups
cp -r "$var_nvim_packer_path"/start "$var_nvim_packer_path"/start.backup
cp -r "$var_nvim_packer_path"/opt "$var_nvim_packer_path"/opt.backup

# applying the fixes
sed -i -r 's/hub.fastgit.org/github.com/' "$var_start_dir_path"/*/.git/config
sed -i -r 's/hub.fastgit.org/github.com/' "$var_opt_dir_path"/*/.git/config

# information for the client
echo "Script is done! The cloudflare (hub.fastgit.org) looped redirection should be fixed."
echo "start nvim and run =>"
echo ":PackerUpdate"
echo "OR"
echo ":PackerSync"
echo "The github.com substitute will correctly redirect to \"hub.fastgit.org\" internally to neovim and do the update of your packages"

# client notification
echo "The Script created backups at \"$var_nvim_packer_path\". You should remove them after PackerUpdate and check that everything works"
