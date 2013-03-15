folder=`osascript -e 'tell application "Finder" to set theFolder to POSIX path of (target of window 1 as alias)'`
cd "$folder"
touch {query}
echo {query} created
