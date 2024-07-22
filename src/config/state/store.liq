let config.state.store = {}

let config.state.store.path =
  utils.env.safeget(default="data/state.json", "FUSION__STATE__STORE__PATH")
