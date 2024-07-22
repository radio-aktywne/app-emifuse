let config.state.cache = {}

let config.state.cache.ttl =
  utils.parse.float(
    utils.env.safeget(default="60", "FUSION__STATE__CACHE__TTL")
  )
