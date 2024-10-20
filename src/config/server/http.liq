let config.server.http = {}

let config.server.http.port =
  utils.parse.int(
    utils.env.safeget(default="10101", "DINGO__SERVER__HTTP__PORT")
  )
