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
	mkdir downloads
	aria2c -d "downloads" -o "$name" "$url"
}

# Uploader Function
startUpload() {
	clear
	cd downloads
	# If folderId is empty upload to root directory
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

# Check if arguments passed from outside
while getopts ":u:n:f:" opt; do
	case $opt in
		u)
			url=$OPTARG
			;;
		n)
			name=$OPTARG
			;;
		f)
			folderid=$OPTARG
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit 1
			;;
		:)
			echo "Option -$OPTARG requires an argument." >&2
			exit 1
			;;
	esac
done

# Download Type Selection Menu
clear
if [ -z "${url}" ]; then
	read -p "Download URL: " url
fi
if [ -z "${name}" ]; then
	read -p "Desired Name: " name
	read -p "Folder ID:(empty for root) " folderid
fi

# Start Download process
startDownload
# Start Upload
startUpload

# Pause and exit
clear
read -n 1 -s -r -p "Press any key to continue"
clear
exit 1