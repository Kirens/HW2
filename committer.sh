#! /usr/bin/env bash

BASE_DATE='Tue, 20 Jan 2013 03:14:16 -0700'

# Create initial data state
cat data.raw | node formatData.js > data

i=0
while [ -s data ]; do
    # Only commit if there is a non-space character
    if [ "$(cat data | head -c 1)" != " " ];
    then
        # Update data state
        git add data
        # Commit at date
        export GIT_COMMITTER_DATE=$(date -d "$BASE_DATE +$i days")
        git commit --date="$GIT_COMMITTER_DATE" -m "Commit pixel no. $i"
    fi
    # Remove first char from file
    printf "$(cat data | tail -c +2)" > data
    ((i++))
done

