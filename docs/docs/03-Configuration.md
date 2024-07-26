---
slug: /configuration
title: Configuration
---

## Environment variables

You can configure the app at runtime using various environment variables:

- `EMIFUSE__SERVER__SRT__PORT`
  port to listen for SRT connections
  (default: `9000`)
- `EMIFUSE__SERVER__HTTP__PORT` -
  port to listen for HTTP connections
  (default: `9001`)
- `EMIFUSE__STATE__STORE__PATH` -
  path to the file to store the state
  (default: `data/state.json`)
- `EMIFUSE__STATE__CACHE__TTL` -
  how long to cache the state in memory in seconds
  (default: `60`)
- `EMIFUSE__EMICAST__ICY__HOST` -
  host of the ICY API of the emicast service
  (default: `localhost`)
- `EMIFUSE__EMICAST__ICY__PORT` -
  port of the ICY API of the emicast service
  (default: `8000`)
- `EMIFUSE__EMICAST__ICY__USER` -
  user to authenticate with the ICY API of the emicast service
  (default: `source`)
- `EMIFUSE__EMICAST__ICY__PASSWORD` -
  password to authenticate with the ICY API of the emicast service
  (default: `password`)
- `EMIFUSE__EMICAST__ICY__MOUNT` -
  mount point of the ICY API of the emicast service to send the audio to
  (default: `radio.mp3`)
- `EMIFUSE__EMITUNES__HTTP__SCHEME` -
  scheme of the HTTP API of the emitunes service
  (default: `http`)
- `EMIFUSE__EMITUNES__HTTP__HOST` -
  host of the HTTP API of the emitunes service
  (default: `localhost`)
- `EMIFUSE__EMITUNES__HTTP__PORT` -
  port of the HTTP API of the emitunes service
  (default: `42000`)
- `EMIFUSE__EMITUNES__HTTP__PATH` -
  path of the HTTP API of the emitunes service
  (default: ``)
