let config.streamcast.icy = {}

let config.streamcast.icy.host =
  utils.env.get(default="localhost", "FUSION__STREAMCAST__ICY__HOST")
let config.streamcast.icy.port =
  utils.parse.int(
    utils.env.get(default="8000", "FUSION__STREAMCAST__ICY__PORT")
  )
let config.streamcast.icy.user =
  utils.env.get(default="source", "FUSION__STREAMCAST__ICY__USER")
let config.streamcast.icy.password =
  utils.env.get(default="password", "FUSION__STREAMCAST__ICY__PASSWORD")
let config.streamcast.icy.mount =
  utils.env.get(default="radio.mp3", "FUSION__STREAMCAST__ICY__MOUNT")
