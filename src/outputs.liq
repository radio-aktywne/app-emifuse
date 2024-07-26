output.icecast(
  %mp3,
  host=config.emicast.icy.host,
  port=config.emicast.icy.port,
  user=config.emicast.icy.user,
  password=config.emicast.icy.password,
  mount=config.emicast.icy.mount,
  icy_metadata=constants.metadata.keys,
  icy_song=fun (_) -> null(),
  streams.radio
)
