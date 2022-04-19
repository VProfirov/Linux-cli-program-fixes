#!/usr/bin/env bash

# gen:problem:path
var_nvim_packer_path=/home/$USER/.local/share/nvim/site/pack/packer
# local:problem:path
var_start_dir_path="$var_nvim_packer_path"/start
var_opt_dir_path="$var_nvim_packer_path"/opt
# grouped:problem:paths_into_locations
var_problem_locations=("$var_start_dir_path" "$var_opt_dir_path")

# working directories' backups
cp -r "$var_nvim_packer_path"/start "$var_nvim_packer_path"/start.backup
cp -r "$var_nvim_packer_path"/opt "$var_nvim_packer_path"/opt.backup

# fix_function
function fn_package_dlrepo_substitution ()
{
	local var_path_to_packages=$1;
	sed -i -r 's/hub.fastgit.org/github.com/' "$var_path_to_packages"/*/.git/config
}

# applying the fix_function
for problem in "${var_problem_locations[@]}";do
	"$(fn_package_dlrepo_substitution "$problem")";
done;

# information for the client
echo "Script is done! The cloudflare (hub.fastgit.org) loop redirect should be fixed."
echo "start nvim and run =>"
echo ":PackerUpdate"
echo "OR"
echo ":PackerSync"
echo "The github.com substitute will correctly redirect to \"hub.fastgit.org\" internally to neovim and do the update of your packages"

# client notification
echo "The Script created backups at \"$var_nvim_packer_path\". You should remove them after PackerUpdate and check that everything works"
