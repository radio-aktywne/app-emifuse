---
slug: /configuration
title: Configuration
---

## Environment variables

You can configure the app at runtime using various environment variables:

- `FUSION__SERVER__HOST` -
  host to listen for live audio
  (default: `0.0.0.0`)
- `FUSION__SERVER__PORT` -
  port to listen for live audio
  (default: `9000`)
- `FUSION__STREAMCAST__ICY__HOST` -
  host of the ICY API of the streamcast service
  (default: `localhost`)
- `FUSION__STREAMCAST__ICY__PORT` -
  port of the ICY API of the streamcast service
  (default: `8000`)
- `FUSION__STREAMCAST__ICY__USER` -
  user to authenticate with the ICY API of the streamcast service
  (default: `source`)
- `FUSION__STREAMCAST__ICY__PASSWORD` -
  password to authenticate with the ICY API of the streamcast service
  (default: `password`)
- `FUSION__STREAMCAST__ICY__MOUNT` -
  mount point of the ICY API of the streamcast service to send the audio to
  (default: `radio.mp3`)
