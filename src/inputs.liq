let inputs = {}

let inputs.fallback = single(constants.paths.fallback)

let inputs.playlist =
  if
    config.emitunes.playlist == ""
  then
    sine(duration=0.0)
  else
    playlist(
      prefetch=3,
      loop=true,
      mode="normal",
      reload=60,
      reload_mode="seconds",
      timeout=60.0,
      "#{config.emitunes.http.url}/playlists/#{config.emitunes.playlist}/m3u"
    )
  end

let inputs.live =
  buffer(
    input.srt(
      bind_address=config.server.host,
      port=config.server.port,
      read_timeout=null(),
      write_timeout=null()
    )
  )
