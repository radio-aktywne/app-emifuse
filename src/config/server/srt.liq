let config.server.srt = {}

let config.server.srt.port =
  utils.parse.int(
    utils.env.safeget(default="10100", "DINGO__SERVER__SRT__PORT")
  )
