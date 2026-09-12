#! /bin/sh
# Print git information and highlight it using sed.
git=$1
boldfmt=$(tput smso)
normfmt=$(tput sgr0)
git status "$git" && git log "$git" | sed "s/Date:/${boldfmt}Date${normfmt}"
