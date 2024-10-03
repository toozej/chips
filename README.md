# Spotify to YouTube Music "CHIPS" Playlist Cloner

Clones the excellent ["CHIPS" Spotify playlist](https://open.spotify.com/playlist/1A81DvosyP0liu2iodN2Rv?si=39783b0796654a12) by [Taylor Pendleton](https://www.taylorpendletonphoto.com/) a.k.a. ["radiodarling"](https://open.spotify.com/user/eythq7kkhoydl18v0gram75jd) to YouTube Music for those who don't have Spotify and/or are invested into YouTube Music instead. This project is designed to be ran on a weekly schedule to grab the latest updates from the official "CHIPS" playlist.

## Pre-reqs
- Docker installed
- modern version of Python 3 installed
- Spotify Premium account (non-premium might work, haven't tried)
- YouTube Music Premium account

## Usage
1. create Spotify API app following https://github.com/sigma67/spotify_to_ytmusic?tab=readme-ov-file#setup
2. (one-time) install spotify_to_ytmusic package locally to run the setup - `pip install spotify_to_ytmusic`
3. login to Spotify and YouTube Music with `spotify_to_ytmusic setup` option 3 "both"
4. copy in your local settings.ini file after logging in into the current directory (on MacOS `~/Library/Caches/spotify_to_ytmusic/settings.ini path/to/chips/dir/settings.ini`) following the example `settings.ini.example` file in this repo
5. (one-time) ensure the settings.ini -> spotify section has the "use_oauth" setting set to "no" (without quotes)
6. (one-time) create "CHIPS" and "CHIPS-Archive" playlists in YouTube Music manually
7. `make all`
8. run this project on a cron-schedule by adding a line like `@weekly make -C path/to/chips/directory/ all > $HOME/cron/logs/chips.log 2>&1` to your crontab
