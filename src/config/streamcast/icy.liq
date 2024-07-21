let config.streamcast.icy = {}

let config.streamcast.icy.host =
  utils.env.safeget(default="localhost", "FUSION__STREAMCAST__ICY__HOST")
let config.streamcast.icy.port =
  utils.parse.int(
    utils.env.safeget(default="8000", "FUSION__STREAMCAST__ICY__PORT")
  )
let config.streamcast.icy.user =
  utils.env.safeget(default="source", "FUSION__STREAMCAST__ICY__USER")
let config.streamcast.icy.password =
  utils.env.safeget(default="password", "FUSION__STREAMCAST__ICY__PASSWORD")
let config.streamcast.icy.mount =
  utils.env.safeget(default="radio.mp3", "FUSION__STREAMCAST__ICY__MOUNT")
