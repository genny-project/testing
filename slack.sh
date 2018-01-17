#!/bin/bash

# Usage: slackpost "<webhook>" "<color>" "<message>"

# ------------
webhook_url=$1
if [[ $webhook_url == "" ]]
then
        echo "No webhook_url specified"
        exit 1
fi

# ------------
shift

color=$1
if [[ $color == "" ]]
then
        echo "No color specified"
        exit 1
fi


# ------------
shift

text=$*

if [[ $text == "" ]]
then
        echo "No text specified"
        exit 1
fi

escapedText=$(echo $text | sed 's/"/\"/g' | sed "s/'/\'/g" )

json="{\"attachments\":[{\"color\":\"$color\" , \"text\": \"$escapedText\"}]}"

curl -s -d "payload=$json" "$webhook_url"

echo "sent $color message to slack"