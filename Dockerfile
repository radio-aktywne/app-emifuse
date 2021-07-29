FROM savonet/liquidsoap-alpine:main

COPY ./fusion/src/radio.liq /tmp

WORKDIR /tmp

ENTRYPOINT ["liquidsoap", "radio.liq"]
