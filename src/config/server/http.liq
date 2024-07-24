let config.server.http = {}

let config.server.http.port =
  utils.parse.int(
    utils.env.safeget(default="9001", "FUSION__SERVER__HTTP__PORT")
  )
