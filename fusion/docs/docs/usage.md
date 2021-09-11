# Usage

To start the server make sure you have [`liquidsoap`](https://www.liquidsoap.info) installed, then `cd` into `src` and run:

```sh
liquidsoap fusion.liq
```

Right after starting it will starting streaming songs from the embedded playlist,
but you can connect with [`SRT`](https://www.haivision.com/products/srt-secure-reliable-transport/) to [`http://localhost:9000`](http://localhost:9000) and send your own audio.

You can try to connect with another `liquidsoap` instance, for example:

```sh
liquidsoap 'output.srt(host="localhost", port=9000, %mp3, sine())'
```
