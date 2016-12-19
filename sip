#!/bin/bash
__track_usage "$(basename "$0")"

dig +short myip.opendns.com @resolver1.opendns.com
