output.icecast(
  %mp3,
  host=config.quokka.icy.host,
  port=config.quokka.icy.port,
  user=config.quokka.icy.user,
  password=config.quokka.icy.password,
  mount=config.quokka.icy.mount,
  icy_metadata=constants.metadata.keys,
  icy_song=fun (_) -> null(),
  streams.radio
)
