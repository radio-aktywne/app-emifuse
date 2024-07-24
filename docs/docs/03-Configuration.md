---
slug: /configuration
title: Configuration
---

## Environment variables

You can configure the app at runtime using various environment variables:

- `FUSION__SERVER__SRT__PORT`
  port to listen for SRT connections
  (default: `9000`)
- `FUSION__SERVER__HTTP__PORT` -
  port to listen for HTTP connections
  (default: `9001`)
- `FUSION__STATE__STORE__PATH` -
  path to the file to store the state
  (default: `data/state.json`)
- `FUSION__STATE__CACHE__TTL` -
  how long to cache the state in memory in seconds
  (default: `60`)
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
- `FUSION__EMITUNES__HTTP__SCHEME` -
  scheme of the HTTP API of the emitunes service
  (default: `http`)
- `FUSION__EMITUNES__HTTP__HOST` -
  host of the HTTP API of the emitunes service
  (default: `localhost`)
- `FUSION__EMITUNES__HTTP__PORT` -
  port of the HTTP API of the emitunes service
  (default: `42000`)
- `FUSION__EMITUNES__HTTP__PATH` -
  path of the HTTP API of the emitunes service
  (default: ``)
