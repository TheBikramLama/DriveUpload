#!/bin/bash

# Command Checker function
checkCommand() {
    local commands=(gdrive aria2c)
    for command in "${commands[@]}"
    do
        if hash $command 2>/dev/null; then
            continue
        else
            clear
            echo "${command} is not installed."
            echo "Please wait while the system installs required packages."
            echo ""

			# Re-initialize packages
			./init.sh
			continue
        fi
    done
}

# Gdrive Login Checker
checkGdrive() {
    clear
    gdrive about
    clear
}

# Downloader Function
startDownload() {
    clear
    aria2c -o "$name" "$url"
}

# Uploader Function
startUpload() {
    clear
	if [ -z "${folderid}" ]; then 
		gdrive upload "$name" --delete
	else 
		gdrive upload --parent "$folderid" "$name" --delete
	fi
}

# Check if commands are installed properly
checkCommand
# Check if Gdrive is logged in
checkGdrive

# Download Type Selection Menu
clear
read -p "Download URL: " url
read -p "Desired Name: " name
read -p "Folder ID:(empty for root) " folderid

# Start Download process
startDownload
# Start Upload
startUpload

# Pause and exit
clear
read -n 1 -s -r -p "Press any key to continue"
clear
exit 1