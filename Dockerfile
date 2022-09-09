ARG LIQUIDSOAP_IMAGE_TAG=v2.1.1

FROM savonet/liquidsoap:$LIQUIDSOAP_IMAGE_TAG

COPY ./fusion/src/ /fusion/src/

WORKDIR /fusion/src

# default configuration, override that with values from your environment
ENV FUSION_TARGET_ICECAST_HOST="localhost" \
    FUSION_TARGET_ICECAST_PORT="8000" \
    FUSION_TARGET_ICECAST_PASSWORD="hackme" \
    FUSION_TARGET_ICECAST_MOUNT="radio.mp3"

# live input on port 9000
EXPOSE 9000/udp

ENTRYPOINT ["./start.sh", "--live", "9000"]
