# Ancrate landing page

Static marketing, support, and privacy pages for Ancrate, built with Astro.

## Development

```sh
npm ci
npm run dev
npm run build
```

Pages: `/`, `/support/`, and `/privacy/`. The public site URL and trailing
slashes are configured in `astro.config.mjs`.

The site uses local images and video. It has no analytics scripts, remote
fonts, third-party video players, forms, or signup backend.

## Content

App screenshots use a fictional sample library. Keep the feature guide and
privacy disclosures in sync with the released app.

Add a verified public distribution URL to `src/config.ts` when the app is
available. Update prelaunch copy at the same time.

## Public support contact

Set `PUBLIC_SUPPORT_EMAIL` in an ignored local environment file for local
builds, and in the repository's Actions variables for published builds.
This is a public site contact: the build includes it in the generated pages.
Keep forwarding destinations and personal contact details outside this
repository.

## Build and serve

The Dockerfile builds the static site and serves it with nginx. The build
workflow publishes a container on pushes to `main`, tagged with the commit
SHA and `latest`. Use an immutable version for releases.

Hosting configuration is managed separately from this repository.
