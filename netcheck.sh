#!/bin/bash

global_log_file="$HOME/Dropbox/Logs/Netcheck/netcheck.log"
nice_date="+%Y-%m-%d %H:%M:%S"

if [ ! -f "$global_log_file" ]; then
    touch "$global_log_file"
fi

wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
        echo "$(date "$nice_date")    Online"
else
        echo "$(date "$nice_date")    Offline" >> "$global_log_file"
fi
