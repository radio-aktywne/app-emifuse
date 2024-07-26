let config.emicast.icy = {}

let config.emicast.icy.host =
  utils.env.safeget(default="localhost", "EMIFUSE__EMICAST__ICY__HOST")
let config.emicast.icy.port =
  utils.parse.int(
    utils.env.safeget(default="8000", "EMIFUSE__EMICAST__ICY__PORT")
  )
let config.emicast.icy.user =
  utils.env.safeget(default="source", "EMIFUSE__EMICAST__ICY__USER")
let config.emicast.icy.password =
  utils.env.safeget(default="password", "EMIFUSE__EMICAST__ICY__PASSWORD")
let config.emicast.icy.mount =
  utils.env.safeget(default="radio.mp3", "EMIFUSE__EMICAST__ICY__MOUNT")
