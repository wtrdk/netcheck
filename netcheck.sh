#!/bin/bash

global_log_file="$HOME/Dropbox/Logs/netcheck_global_$(date +%Y-%m-%d).log"

if [ ! -f "$global_log_file" ]; then
    touch "$global_log_file"
fi

wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
        echo "$(date +%Y-%m-%d_%H:%M:%S)        Online" | tee -a "$global_log_file"
else
        echo "$(date +%Y-%m-%d_%H:%M:%S)        Offline" | tee -a "$global_log_file"
fi
