#!/usr/bin/env bash
# wget -O kicad-library-master.zip https://github.com/$CIRCLE_PROJECT_USERNAME/kicad-library/archive/master.zip
# unzip -o kicad-library-master.zip
wget -O kicad-library-utils-master.zip https://github.com/KiCad/kicad-library-utils/archive/master.zip
unzip -o kicad-library-utils-master.zip

PR_NUMBER=$(echo "$CI_PULL_REQUEST" | grep -Po '\/pull\/\K[0-9]+')
echo $PR_NUMBER
FILES="$(curl -s https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/pulls/$PR_NUMBER/files | jq -r '.[] .filename')"
echo $FILES
./kicad-library-utils-master/pcb/check_kicad_mod.py $FILES