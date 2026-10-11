# Ancrate landing page

Marketing, support, and privacy pages for `https://ancrate.sakrist.com`.
Static Astro site using the same framework and container hosting approach as
`habit-app-landingpage`. It has its own source and release lifecycle.

## Development

```sh
npm ci
npm run dev
npm run build
```

Pages: `/`, `/support/`, `/privacy/`. Canonical URL and trailing slashes are
configured in `astro.config.mjs`. The site has no analytics, remote fonts,
third-party video embeds, forms, or signup backend.

## Content

Release copy and fictional sample-library captures come from the Ancrate
app repository's `release/2026-10-11/` launch kit. Privacy disclosures follow
`docs/privacy.md`, with website and support email details added.

Public contact: `support_ancrate@sakrist.com`.
Planned Cloudflare forwarding destination: `sakristx+ancrate@gmail.com`.
The forwarding rule and destination verification must be completed separately;
the mailto links do not configure mail delivery.

The app is not released. Add its verified public distribution URL to
`src/config.ts` at launch, update prelaunch description copy, and reconcile
feature/support/privacy content with the final distributed edition.

The supplied video is a promotional montage of app captures, with music.
It is served locally and does not autoplay. The textual feature and support
guide cover the demonstrated features.

## Hosting

The Dockerfile builds static files and serves them through nginx. GitHub Actions
publishes `ghcr.io/sakrist/ancrate-landingpage:<full-commit-sha>` and `:latest`
when `main` is pushed. Use an immutable commit tag for cluster deployment.

Keep deployment manifests, `ancrate.sakrist.com` DNS/tunnel routing, and email
forwarding in `k3s-cluster`. The existing Cloudflare tunnel can serve this site;
it does not need a new tunnel or email server.

Before publication:

1. Create/push the GitHub repository and wait for its image build.
2. Set the cluster manifest to the published image's commit tag.
3. Ensure the cluster has permission to pull the image.
4. Deploy the site, then add its DNS/tunnel route through the existing Terraform.
5. Verify the public marketing, support, and privacy URLs.
6. Complete and test support email forwarding.

Use `https://ancrate.sakrist.com/` for the marketing URL,
`https://ancrate.sakrist.com/support/` for the support URL, and
`https://ancrate.sakrist.com/privacy/` for the privacy-policy URL once live.
