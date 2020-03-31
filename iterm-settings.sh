# iTerm Profile switch according to MacOS Dark Mode.
# The iTerm Profile need to be called "Default" and "Dark". 
if [[ "$(uname -s)" == "Darwin" ]]; then
	
	set_iterm_profile_default() {
		echo -ne "\033]50;SetProfile=Default\a"
		export $ITERM_PROFILE="Default"
	}

	set_iterm_profile_dark() {
		echo -ne "\033]50;SetProfile=Dark\a"
		export $ITERM_PROFILE="Dark"
	}

	iterm_color_match_system() {
		# From macos_is_dark() function in https://github.com/pndurette/zsh-lux/blob/master/zsh-lux.plugin.zsh
		dark_mode=$(osascript -l JavaScript -e \
			"Application('System Events').appearancePreferences.darkMode.get()")


		if [[ $dark_mode == true ]]; then
			echo "setting dark"
			set_iterm_profile_dark
		else
			echo "setting default"
			set_iterm_profile_default
		fi
	}

	iterm_color_match_system
fi 
