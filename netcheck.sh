#!/bin/bash

global_log_file="$HOME/Dropbox/Logs/Netcheck/netcheck_global_$(date +%Y-%m-%d).log"
format_date() {
  date "+%Y-%m-%d %H:%M:%S" "$1"
}

if [ ! -f "$global_log_file" ]; then
    touch "$global_log_file"
fi

wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
        echo "$(format_date)    Online" >> "$global_log_file"
else
        echo "$(format_date)    Offline" >> "$global_log_file"
fi
