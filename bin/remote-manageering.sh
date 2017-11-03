#!/bin/bash

echo 'getting latest from github'
cd /var/www/manageering/

git reset --hard
git pull
bundle install
php scripts/strava.php
jekyll build

echo '** done manageering deployed. **'
