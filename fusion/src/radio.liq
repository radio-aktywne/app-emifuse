radio = mksafe(sine())

env = environment()
host = list.assoc("DECAY_HOST", env)
port = int_of_string(list.assoc("DECAY_PORT", env))
password = list.assoc("DECAY_PASSWORD", env)
mount = list.assoc("DECAY_MOUNT", env)

out = output.icecast(host=host, port=port, password=password)
out(%mp3, mount=mount, radio)
