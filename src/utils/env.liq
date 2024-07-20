let utils.env = {}

def utils.env.get(~default="", key) =
  list.assoc(default=default, key, environment())
end
