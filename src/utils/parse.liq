let utils.parse = {}

def utils.parse.int(value) =
  int_of_string(value)
end

def utils.parse.optional_int(value) =
  if value == "" then null() else utils.parse.int(value) end
end
