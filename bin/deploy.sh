#!/bin/bash

git add .

OUTPUT="$(git -c color.status=false status \
| sed -n -e '1,/Changes to be committed:/ d' \
            -e '1,1 d' \
            -e '/^Untracked files:/,$ d' \
            -e 's/^\s*//' \
            -e '/./p')"
git commit -m "${OUTPUT}"

git push origin
jekyll build
ssh -T -p 9092 wumpus@ssh.jotlab.com < ./bin/remote-manageering.sh
