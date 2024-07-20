let config.server = {}

let config.server.host =
  utils.env.get(default="0.0.0.0", "FUSION__SERVER__HOST")
let config.server.port =
  int_of_string(utils.env.get(default="9000", "FUSION__SERVER__PORT"))
