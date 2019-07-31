#!/usr/bin/env bash

# Credit:
# https://gist.github.com/prasadsilva/225fd0394a51e52bf62f#file-fresh-chrome-with-custom-tz-sh

# References:
# http://stackoverflow.com/questions/16448754/how-to-use-a-custom-time-in-browser-to-test-for-client-vs-server-time-difference

# fresh-chrome
#
# Use this script on OS X to launch a new instance of Google Chrome
# with its own empty cache, cookies, and user configuration.
#
# The first time you run this script, it will launch a new Google
# Chrome instance with a permanent user-data directory, which you can
# customize below. Perform any initial setup you want to keep on every
# new Chrome instance, such as adding bookmarks and extensions. Then
# quit this Chrome instance with Command-Q or by selecting "Quit" from
# the "Chrome" menu. (The red "close" button is not sufficient.)
#
# AFTER that, every time you run this script it will launch a new
# Google Chrome instance with a temporary user-data directory copied
# from the one you set up the first time you ran this script. Every
# new instance of Google Chrome launched by this script will be
# completely isolated from the others.



### Customize these

# Change this to the spoof a different timezone. Helpful for testing timezone specific client facing content.
#
# More timezones at https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
default_tz="America/Los_Angeles"
#default_tz="America/Phoenix"


# Or use the first command line argument
#   eg. script.sh America/Los_Angeles
if [ "$1" != "" ]; then
    export TZ=$1
else
    export TZ=$default_tz
fi


# Permanent directory to store the user-data directory of your 'fresh'
# Chrome configuration.
fresh_dir="$HOME/tmp/.fresh-chrome/$TZ"

# Temporary directory in which to create new user-data directories for
# temporary Chrome instances.
tmp_dir="$HOME/tmp/chrome-profiles/$TZ"


echo $TZ

### Main script begins

set -e

timestamp=`date +%Y%m%d%H%M%S`

if [[ -e "$fresh_dir" ]]; then
    user_dir="$tmp_dir/chrome-$timestamp-$RANDOM"
    #cp -r "$fresh_dir" "$user_dir"
    exec open -na "Google Chrome" --args "--user-data-dir=$user_dir"
else
    exec open -na "Google Chrome" --args "--user-data-dir=$fresh_dir"
fi


# The MIT License (MIT)
#
# Copyright (c) 2013 Stuart Sierra
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation files
# (the "Software"), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
