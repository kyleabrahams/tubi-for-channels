# Tubi for Channels

Current version: **1.03a**

# About
This takes Tubi Live TV Channels and generates an M3U playlist and EPG XMLTV file.

# Changes
 - Version 1.03a: 
    - More error handling
 - Version 1.03: 
    - Added additional error handling
 - Version 1.02: 
    - Updated TMSID handing to clear incorrect Tubi listed TMSIDs
 - Version 1.01: 
    - Added Error handling for when channel does not have URL Stream
 - Version 1.00: 
    - Main Release
    - Added EPG Scheduler.
    - Updates to Gracenote Mapping


# Running
The recommended way of running is to pull the image from [GitHub](https://github.com/jgomez177/tubi-for-channels/pkgs/container/tubi-for-channels).

    docker run -d --restart unless-stopped --network=host -e TUBI_PORT=[your_port_number_here] --name  tubi-for-channels ghcr.io/jgomez177/tubi-for-channels

    docker run -d --restart unless-stopped --network=host -e TUBI_PORT=7777 --name  tubi-for-channels ghcr.io/jgomez177/tubi-for-channels

or

    docker run -d --restart unless-stopped -p 80:7777 --name  tubi-for-channels ghcr.io/jgomez177/tubi-for-channels

You can retrieve the playlist and EPG via the status page.

    http://127.0.0.1:[your_port_number_here]
    http://192.168.50.24:7777

    docker run -p 7777:7777 ghcr.io/jgomez177/tubi-for-channels

    

## Environement Variables
| Environment Variable | Description | Default |
|---|---|---|
| TUBI_PORT | Port the API will be served on. You can set this if it conflicts with another service in your environment. | 7777 |

## Additional URL Parameters
| Parameter | Description |
|---|---|
| gracenote | "include" will utilize gracenote EPG information and filter to those streams utilizing Gracenote. "exclude" will filter those streams that do not have a matching gracenote EPG data. |

## Optional Custom Gracenote ID Matching

Adding a docker volume to /app/tubi_data will allow you to add a custom comma delimited csv file to add or change any of the default gracenote matching for any tubi channel

    docker run -d --restart unless-stopped --network=host -e TUBI_PORT=[your_port_number_here] -v [your_file_location_here]:/app/tubi_data --name  tubi-for-channels ghcr.io/jgomez177/tubi-for-channels

Create a file called `tubi_custom_tmsid.csv` with the following headers (case-sensitive):
| id |  name | tmsid | time_shift | 
|---|---|---|---|
| (required) id of the Tubi channel (more on obtaining this ID below) | (optional) Easy to read name | (required) New/Updated Gracenote TMSID number for the channel | (optional) Shifting EPG data for the channel in hours. Ex: To shift the EPG 5 hours earlier, value would be -5 | 

Example

    id,name,tmsid,time_shift
    400000011,TV One Crime & Justice,145680,


***

If you like this and other linear containers for Channels that I have created, please consider supporting my work.

[![](https://pics.paypal.com/00/s/MDY0MzZhODAtNGI0MC00ZmU5LWI3ODYtZTY5YTcxOTNlMjRm/file.PNG)](https://www.paypal.com/donate/?hosted_button_id=BBUTPEU8DUZ6J)

docker run -d --restart unless-stopped --network=host -e TUBI_PORT=[192.168.50.24] --name  tubi-for-channels ghcr.io/jgomez177/tubi-for-channels

docker run -d --restart unless-stopped --network=host -e 7777=127.0.0.1 --name  tubi-for-channels ghcr.io/jgomez177/tubi-for-channels


http://127.0.0.1:7777

http://localhost:7777/tubi/playlist.m3u

http://192.168.50.24:7777/tubi/playlist.m3u


docker logs ghcr.io/jgomez177/tubi-for-channels

docker exec -it ghcr.io/jgomez177/tubi-for-channels /bin/bash
apt-get update && apt-get install tcpdump

docker buildx build --platform linux/amd64,linux/arm64 -t tubi-for-channels --push .
docker buildx build --platform linux/amd64,linux/arm64 -t tubi-for-channels --load .
docker pull --platform linux/arm64 tubi-for-channels
docker tag tubi-for-channels kyleabr17/tubi-for-channels:latest


docker buildx build --platform linux/amd64,linux/arm64 -t tubi-for-channels .



