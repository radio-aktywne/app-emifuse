let config.emitunes.http = {}

let config.emitunes.http.scheme =
  utils.env.get(default="http", "FUSION__EMITUNES__HTTP__SCHEME")
let config.emitunes.http.host =
  utils.env.get(default="localhost", "FUSION__EMITUNES__HTTP__HOST")
let config.emitunes.http.port =
  utils.parse.optional_int(
    utils.env.get(default="42000", "FUSION__EMITUNES__HTTP__PORT")
  )
let config.emitunes.http.path =
  utils.env.get(default="", "FUSION__EMITUNES__HTTP__PATH")
let config.emitunes.http.url =
  utils.url.build(
    scheme=config.emitunes.http.scheme,
    host=config.emitunes.http.host,
    port=
      if
        config.emitunes.http.port == null()
      then
        ""
      else
        string(config.emitunes.http.port)
      end,
    path=config.emitunes.http.path
  )
