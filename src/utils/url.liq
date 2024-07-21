let utils.url = {}

def utils.url.build(~scheme="http", ~host, ~port="", ~path="") =
  path =
    if
      path != "" and not string.contains(prefix="/", path)
    then
      "/#{path}"
    else
      path
    end

  url = "#{scheme}://#{host}"
  url = if port == "" then url else "#{url}:#{port}" end
  url = if path == "" then url else "#{url}#{path}" end

  url
end
