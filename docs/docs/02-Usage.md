---
slug: /usage
title: Usage
---

## Sending live audio

You can send live audio using the
[`SRT`](https://www.haivision.com/products/srt-secure-reliable-transport)
protocol.

You can use any audio codec and container,
but we recommend using [`Opus`](https://opus-codec.org) and
[`Ogg`](https://www.xiph.org/ogg) respectively.
They are free and open source, focused on quality and efficiency,
and support embedding metadata into the stream.

For example, you can use [`Liquidsoap`](https://www.liquidsoap.info) for that:

```sh
liquidsoap \
    'output.srt(
        host="127.0.0.1",
        port=9000,
        %ogg(%opus),
        sine()
    )'
```

Alternatively, you can use [`ffmpeg`](https://ffmpeg.org) to do the same:

```sh
ffmpeg \
    -re \
    -f lavfi \
    -i sine \
    -c libopus \
    -f ogg \
    srt://127.0.0.1:9000
```
