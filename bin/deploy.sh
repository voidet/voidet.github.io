#!/bin/bash

jekyll build
OUTPUT="$(git -c color.status=false status \
| sed -n -e '1,/Changes to be committed:/ d' \
            -e '1,1 d' \
            -e '/^Untracked files:/,$ d' \
            -e 's/^\s*//' \
            -e '/./p')"

cd _site
git checkout master
git add -u .
git commit -m "${OUTPUT}"
git push origin

cd ../
git add .
git commit -m "${OUTPUT}"
git push origin

# ssh -T -p 9092 wumpus@ssh.jotlab.com < ./bin/remote-manageering.sh
