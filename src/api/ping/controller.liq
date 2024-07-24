let api.ping.controller = {}

def api.ping.controller.ping(_) =
  api.ping.service.ping()
  api.responses.empty(headers=[("Cache-Control", "no-cache")])
end

api.app.register(method="GET", path="/ping", api.ping.controller.ping)
