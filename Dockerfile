FROM savonet/liquidsoap:main

COPY ./fusion/src/ /fusion/src/

WORKDIR /fusion/src

# default configuration, override that with values from your environment
ENV DECAY_HOST="decay" \
    DECAY_PORT="8000" \ 
    DECAY_PASSWORD="hackme" \
    DECAY_MOUNT="radio.mp3"

# live input on port 8000
EXPOSE 8000/udp

ENTRYPOINT ["liquidsoap", "radio.liq"]
