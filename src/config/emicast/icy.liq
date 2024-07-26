let config.emicast.icy = {}

let config.emicast.icy.host =
  utils.env.safeget(default="localhost", "FUSION__EMICAST__ICY__HOST")
let config.emicast.icy.port =
  utils.parse.int(
    utils.env.safeget(default="8000", "FUSION__EMICAST__ICY__PORT")
  )
let config.emicast.icy.user =
  utils.env.safeget(default="source", "FUSION__EMICAST__ICY__USER")
let config.emicast.icy.password =
  utils.env.safeget(default="password", "FUSION__EMICAST__ICY__PASSWORD")
let config.emicast.icy.mount =
  utils.env.safeget(default="radio.mp3", "FUSION__EMICAST__ICY__MOUNT")
