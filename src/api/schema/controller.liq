let api.schema.controller = {}

def api.schema.controller.get(_) =
  schema = api.schema.service.get()
  api.responses.html(status=api.codes.ok, body=schema)
end

api.app.register(method="GET", path="/schema", api.schema.controller.get)
