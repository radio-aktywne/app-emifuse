---
slug: /configuration
title: Configuration
---

## Environment variables

You can configure the app at runtime using various environment variables:

- `FUSION_SOURCE_LIVE_PORT` -
  port to listen for live audio
  (default: `9000`)
- `FUSION_TARGET_ICECAST_HOST` -
  host of the `Icecast` server to send audio to
  (default: `localhost`)
- `FUSION_TARGET_ICECAST_PORT` -
  port of the `Icecast` server to send audio to
  (default: `8000`)
- `FUSION_TARGET_ICECAST_USER` -
  user to authenticate with the `Icecast` server
  (default: `source`)
- `FUSION_TARGET_ICECAST_PASSWORD` -
  password to authenticate with the `Icecast` server
  (default: `password`)
- `FUSION_TARGET_ICECAST_MOUNT` -
  mount point of the `Icecast` server to send audio to
  (default: `radio.mp3`)
