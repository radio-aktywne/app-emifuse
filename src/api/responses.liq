let api.responses = {}

def api.responses.http(~status, ~headers=[], ~body) =
  http.response(status_code=status, headers=headers, data=body)
end

def api.responses.empty(~headers=[]) =
  api.responses.http(
    status=api.codes.nocontent,
    headers=list.append(headers, [("Content-Length", "0")]),
    body=""
  )
end

def api.responses.text(~status, ~headers=[], ~body) =
  api.responses.http(
    status=status,
    headers=
      list.append(
        headers,
        [
          ("Content-Type", "text/plain"),
          ("Content-Length", string(string.length(body)))
        ]
      ),
    body=body
  )
end

def api.responses.html(~status, ~headers=[], ~body) =
  api.responses.http(
    status=status,
    headers=
      list.append(
        headers,
        [
          ("Content-Type", "text/html"),
          ("Content-Length", string(string.length(body)))
        ]
      ),
    body=body
  )
end

def api.responses.json(~status, ~headers=[], ~body) =
  api.responses.http(
    status=status,
    headers=
      list.append(
        headers,
        [
          ("Content-Type", "application/json"),
          ("Content-Length", string(string.length(body)))
        ]
      ),
    body=body
  )
end
