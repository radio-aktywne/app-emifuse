output.icecast(
  %mp3,
  host=config.streamcast.icy.host,
  port=config.streamcast.icy.port,
  user=config.streamcast.icy.user,
  password=config.streamcast.icy.password,
  mount=config.streamcast.icy.mount,
  icy_metadata=constants.metadata.keys,
  icy_song=fun (_) -> null(),
  streams.radio
)
