#!/usr/bin/env chips

# Setup
spotify_to_ytmusic setup --file settings.ini

# Update YTM Chips playlist
spotify_to_ytmusic update https://open.spotify.com/playlist/1A81DvosyP0liu2iodN2Rv?si=fd85319d9d114883 CHIPS
FAILED=$?

# Append to YTM Chips Archive Playlist
spotify_to_ytmusic update --append APPEND https://open.spotify.com/playlist/1A81DvosyP0liu2iodN2Rv?si=fd85319d9d114883 OldCHIPS
FAILED=$?

if [[ FAILED -ne 0 ]]; then
    TITLE="CHIPS Sync Failed"
    BODY="CHIPS sync failed, see logs on Enzo ~/cron/logs/chips.log"
else
    TITLE="CHIPS Sync Successful"
    BODY="Great success!"
fi

curl -s "https://${GOTIFY_ENDPOINT}/message?token=${GOTIFY_TOKEN}" \
    -F "title=${TITLE}" \
    -F "message=${BODY}" \
    -F "priority=0"
