FROM savonet/liquidsoap-alpine:main

COPY ./fusion/src/radio.liq /tmp

WORKDIR /tmp

ENV DECAY_HOST="decay" \
    DECAY_PORT="8000" \ 
    DECAY_PASSWORD="hackme" \
    DECAY_MOUNT="radio.mp3"

ENTRYPOINT ["liquidsoap", "radio.liq"]
