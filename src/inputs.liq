let inputs = {}

let inputs.music = single(constants.paths.fallback)

let inputs.live =
  buffer(
    input.srt(
      bind_address=config.server.host,
      port=config.server.port,
      read_timeout=null(),
      write_timeout=null()
    )
  )
