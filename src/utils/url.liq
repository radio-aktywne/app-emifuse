let utils.url = {}

def utils.url.build(~scheme="http", ~host, ~port=null(), ~path=null()) =
  pathify =
    fun (value) ->
      begin
        value = string(value)
        if
          value == "" or string.contains(prefix="/", value)
        then
          value
        else
          "/#{value}"
        end
      end

  url = "#{scheme}://#{host}"
  url = port == null() ? url : "#{url}:#{string(port)}"
  url = path == null() ? url : "#{url}#{pathify(path)}"

  url
end
