#!/usr/bin/env chips

# Setup
spotify_to_ytmusic setup --file settings.ini

# Update YTM Chips playlist
spotify_to_ytmusic update https://open.spotify.com/playlist/1A81DvosyP0liu2iodN2Rv?si=fd85319d9d114883 CHIPS

# Append to YTM Chips-Archive Playlist
spotify_to_ytmusic update --append APPEND https://open.spotify.com/playlist/1A81DvosyP0liu2iodN2Rv?si=fd85319d9d114883 CHIPS-Archive
