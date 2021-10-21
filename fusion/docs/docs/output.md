# Output

Currently, `fusion` supports sending the output only to an [Icecast](https://icecast.org) server (nicknamed `decay` here).
You need to provide some info about it using environmental variables:

- `FUSION_TARGET_ICECAST_HOST` - address of the host where the Icecast server is running
- `FUSION_TARGET_ICECAST_PORT` - port at which the Icecast server is listening
- `FUSION_TARGET_ICECAST_PASSWORD` - password used for accessing Icecast
- `FUSION_TARGET_ICECAST_MOUNT` - mount point

For example if you have your Icecast server running at `localhost` at port `8000`,
you kept the default password and you want to have your audio available at [`http://localhost:8080/radio.mp3`](http://localhost:8080/radio.mp3)
then you should set:

- `FUSION_TARGET_ICECAST_HOST=localhost`
- `FUSION_TARGET_ICECAST_PORT=8000`
- `FUSION_TARGET_ICECAST_PASSWORD=hackme`
- `FUSION_TARGET_ICECAST_MOUNT=radio.mp3`
