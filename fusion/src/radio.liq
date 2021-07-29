radio = mksafe(sine())

env = environment()
host = list.assoc(default="localhost", "ICECAST_HOST", env)
port = int_of_string(list.assoc(default="8080", "ICECAST_PORT", env))
password = list.assoc(default="hackme", "ICECAST_PASSWORD", env)

out = output.icecast(host=host, port=port, password=password)
out(%mp3, mount="radio.mp3", radio)
