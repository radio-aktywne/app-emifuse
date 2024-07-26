let config.server.srt = {}

let config.server.srt.port =
  utils.parse.int(
    utils.env.safeget(default="9000", "EMIFUSE__SERVER__SRT__PORT")
  )
