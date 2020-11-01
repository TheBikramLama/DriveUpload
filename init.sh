#!/bin/bash

# Install Gdrive
go get github.com/TheBikramLama/gdrive
# Install aria2
sudo apt-get install -y aria2

# Make Executables
chmod +x upload.sh
chmod +x upload.sh

# Exit
clear
echo "'./upload.sh' To upload a file."
echo ""
echo "'./logout.sh' To logout from current gdrive."
echo ""
read -n 1 -s -r -p "Press any key to continue."
clear