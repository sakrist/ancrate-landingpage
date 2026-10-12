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

## Direct download and updates

Ancrate is intended for Developer ID-signed, notarized website distribution.
`public/updates/appcast.xml` is an intentionally empty Sparkle feed until a verified signed release is available; nginx disables long-lived caching for this path.

Publish immutable versioned artifacts before adding a signed enclosure to the feed. Keep Sparkle’s private signing key out of this repository and the web server. Only set `src/config.ts`’s download URL after notarization and installation/upgrade checks pass. Hosting/deployment is managed separately.

A one-time Stripe purchase priced at 4.99 is planned later; currency, tax presentation and licensing remain to be decided. No checkout or price claim is published by these changes.

The app repository provides `scripts/package-direct-release.sh` and
`scripts/create-update-feed.sh`; see its `docs/direct-release-workflow.md`.
Copy only verified notarized DMGs into `public/downloads/` and matching release
notes into `public/releases/`. Upload/verify artifacts before updating
`public/updates/appcast.xml`. Versioned downloads use immutable caching; the
feed must revalidate. Keep the download URL empty until installation, real
signed-upgrade testing and the initial purchase decision are complete.

## Candidate upload for verification

The owner requested uploading build 8 before completing distribution verification.
Its immutable candidate DMG and notes are under `/downloads/candidates/` and
`/releases/candidates/`; metadata is in `/releases/candidates/manifest.json`.
The candidate feed is `/updates/candidates/appcast.xml`. The production feed
remains empty and the homepage stays prelaunch unless the owner changes that choice.

The candidate app is Developer ID-signed and notarized. Retrieval of the DMG’s
own ticket, clean-install checks and a real signed upgrade remain open. Stapling
changes archive bytes: publish a new artifact name and signature afterward,
rather than replacing this immutable URL.

Deployment is in `sakrist/k3s-cluster`, under `ancrate-landing/`. After the image
build succeeds, pin its source SHA and digest in the Deployment and push that
specific manifest change. Argo CD syncs two replicas in `ancrate-web`.
