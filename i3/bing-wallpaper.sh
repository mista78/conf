#!/bin/sh
imagepath="$HOME/Images/bing-wallpaper.jpg"
urlpath=$( \
sleep 2
curl "https://www.bing.com/HPImageArchive.aspx?format=rss&idx=0&n=1&mkt=fr-FR" \
| xmllint --xpath "/rss/channel/item/link/text()" - \
| sed 's/1366x768/1920x1200/g' \
)
curl "https://www.bing.com$urlpath" -o $imagepath
feh --bg-fill $imagepath