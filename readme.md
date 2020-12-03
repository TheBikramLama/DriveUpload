# Drive-Upload

## Installation
1. Clone the repository.<br />
`git clone https://github.com/TheBikramLama/DriveUpload`
2. Make **init.sh** executable.<br />
`chmod +x init.sh`
3. Run **init.sh**<br />
`./init.sh`

## Uploading
Run **upload.sh**<br />
`./upload.sh`

## Uploading with options
`./upload.sh -u "https://site.com/file.zip" -n "My-file.zip" -f "123456789"`<br />
1. `-u` **URL** of designated download file
2. `-n` **New name** for the downloaded file
3. `-f` **Google drive folder ID** to upload the downloaded file *(Optional)*

## Logging out
Run **logout.sh**<br />
`./logout.sh`

<br /><br />
## Credits
- [Gdrive](https://github.com/prasmussen/gdrive)
