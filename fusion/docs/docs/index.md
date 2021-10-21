# fusion

Audio streaming with Liquidsoap 🧼

`fusion` is a [`liquidsoap`](https://www.liquidsoap.info) server that fuses music from playlists and live audio and sends one output stream to broadcast servers.

To start the server make sure you have [`liquidsoap`](https://www.liquidsoap.info) installed, then `cd` into `src` and run:

```sh
liquidsoap fusion.liq
```

Right after starting it will starting streaming songs from the embedded playlist,
but you can connect with [`SRT`](https://www.haivision.com/products/srt-secure-reliable-transport/) to [`srt://localhost:9000`](srt://localhost:9000) by default and send your own audio.
