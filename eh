#!/bin/bash
__track_usage "$(basename "$0")"

MAX_CACHE=21600 # 6 hours (sec)
EC2_CACHE="$HOME/.ec2_host"

file_age() {
  stat -f "%Sm" -t "%s" "$1"
}

cur_time=$(date "+%s")
last_mod=$(file_age "$EC2_CACHE")
cache_age=$(echo "$cur_time - $last_mod" | bc)

if [ "$cache_age" -gt "$MAX_CACHE" ]; then
  ec2-host > "$EC2_CACHE"
  eh_refresh
fi

cat "$EC2_CACHE"


