---
slug: /configuration
title: Configuration
---

## Environment variables

You can configure the app at runtime using various environment variables:

- `FUSION_HOST` -
  host to listen for live audio
  (default: `0.0.0.0`)
- `FUSION_PORT` -
  port to listen for live audio
  (default: `9000`)
- `FUSION_STREAMCAST_HOST` -
  host of the `streamcast` app to send audio to
  (default: `localhost`)
- `FUSION_STREAMCAST_PORT` -
  port of the `streamcast` app to send audio to
  (default: `8000`)
- `FUSION_STREAMCAST_USER` -
  user to authenticate with the `streamcast` app
  (default: `source`)
- `FUSION_STREAMCAST_PASSWORD` -
  password to authenticate with the `streamcast` app
  (default: `password`)
- `FUSION_STREAMCAST_MOUNT` -
  mount point of the `streamcast` app to send audio to
  (default: `radio.mp3`)
