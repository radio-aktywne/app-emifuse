let config.server.http = {}

let config.server.http.port =
  utils.parse.int(
    utils.env.safeget(default="9001", "EMIFUSE__SERVER__HTTP__PORT")
  )
