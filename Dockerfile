FROM savonet/liquidsoap-alpine:main

COPY src/radio.liq /tmp

WORKDIR /tmp

ENTRYPOINT ["liquidsoap", "radio.liq"]