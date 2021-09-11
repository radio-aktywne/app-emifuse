# Output

Currently, `fusion` supports sending the output only to an [Icecast](https://icecast.org) server (nicknamed `decay` here).
You need to provide some info about it using environmental variables:

- `DECAY_HOST` - address of the host where the Icecast server is running
- `DECAY_PORT` - port at which the Icecast server is listening
- `DECAY_SOURCE_PASSWORD` - password used for accessing Icecast
- `DECAY_MOUNT` - mount point

For example if you have your Icecast server running at `localhost` at port `8000`,
you kept the default password and you want to have your audio available at [`http://localhost:8080/radio.mp3`](http://localhost:8080/radio.mp3)
then you should set:

- `DECAY_HOST=localhost`
- `DECAY_PORT=8000`
- `DECAY_SOURCE_PASSWORD=hackme`
- `DECAY_MOUNT=radio.mp3`
