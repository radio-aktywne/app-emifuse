let config.server = {}

let config.server.host =
  utils.env.safeget(default="0.0.0.0", "FUSION__SERVER__HOST")
let config.server.port =
  utils.parse.int(utils.env.safeget(default="9000", "FUSION__SERVER__PORT"))
