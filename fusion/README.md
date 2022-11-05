<h1 align="center">fusion</h1>

<div align="center">

audio streaming with liquidsoap 🧼

[![Build](https://github.com/radio-aktywne/fusion/actions/workflows/build.yaml/badge.svg)](https://github.com/radio-aktywne/fusion/actions/workflows/build.yaml)
[![Docs](https://github.com/radio-aktywne/fusion/actions/workflows/docs.yaml/badge.svg)](https://github.com/radio-aktywne/fusion/actions/workflows/docs.yaml)

</div>

---

`fusion` is a [`liquidsoap`](https://www.liquidsoap.info) server that fuses music from playlists and live audio and sends one output stream to broadcast servers.

## Usage

To start the server make sure you have [`liquidsoap`](https://www.liquidsoap.info) installed, then `cd` into `src` and run:

```sh
./start.sh
```

Right after starting it will start streaming songs from the embedded playlist,
but you can connect with [`SRT`](https://www.haivision.com/products/srt-secure-reliable-transport/) to [`srt://localhost:9000`](srt://localhost:9000) by default and send your own audio.

## Output

Currently, `fusion` supports sending the output only to an [Icecast](https://icecast.org) server.
You need to provide some info about it using environmental variables:

- `FUSION_TARGET_ICECAST_HOST` - address of the host where the Icecast server is running
- `FUSION_TARGET_ICECAST_PORT` - port at which the Icecast server is listening
- `FUSION_TARGET_ICECAST_PASSWORD` - password used for accessing Icecast
- `FUSION_TARGET_ICECAST_MOUNT` - mount point
