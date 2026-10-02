#!/usr/bin/env bash
# Create a privacy policy page for a new app and list it on the home page.
# Usage: ./new-app.sh "App Name" com.vumslabs.appname [slug]
# Result: https://vumslabs.procomsoftsol.com/<slug>/privacy-policy/
set -euo pipefail
cd "$(dirname "$0")"

name="${1:?App name required}"
package="${2:?Package name required}"
slug="${3:-$(echo "$name" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-|-$//g')}"
date="$(date '+%B %-d, %Y')"
out="$slug/privacy-policy/index.html"

[ -e "$out" ] && { echo "Exists: $out"; exit 1; }
mkdir -p "$slug/privacy-policy"
sed -e "s|{{APP_NAME}}|$name|g" -e "s|{{PACKAGE}}|$package|g" -e "s|{{DATE}}|$date|g" \
  _template/privacy-policy.html > "$out"

entry="    <li class=\"card\"><strong>$name</strong> <a href=\"/$slug/privacy-policy/\">Privacy Policy</a></li>"
awk -v e="$entry" '/APP-LIST:END/{print e} {print}' index.html > index.html.tmp && mv index.html.tmp index.html

echo "Created $out"
echo "Edit the 'EDIT:' sections to match the app's Data safety form."
echo "Play Console URL: https://vumslabs.procomsoftsol.com/$slug/privacy-policy/"
