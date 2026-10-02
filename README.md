# VUMS LABS — Privacy Policies

Static site (GitHub Pages) served at **https://vumslabs.procomsoftsol.com**.
VUMS LABS is the Google Play publishing brand of Procom Soft Solutions. Contact: playstore@procomsoftsol.com

## Add an app

```bash
./new-app.sh "App Name" com.vumslabs.appname
```

This creates `app-name/privacy-policy/index.html` and lists the app on the home page.
Then edit the sections marked `EDIT:` so they match the app's Play Console **Data safety** form, commit and push.

Use this URL in Play Console → App content → Privacy policy:
`https://vumslabs.procomsoftsol.com/app-name/privacy-policy/`

## One-time setup

1. DNS (at the procomsoftsol.com DNS provider): add
   `CNAME  vumslabs  →  <github-username-or-org>.github.io`
2. GitHub repo → Settings → Pages: deploy from branch `main`, folder `/ (root)`.
   Custom domain `vumslabs.procomsoftsol.com` (already in `CNAME`), then tick **Enforce HTTPS** once the certificate is issued.
