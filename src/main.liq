### Constants

SOURCE_PATH = "src/"
RESOURCES_PATH = "#{SOURCE_PATH}/resources/"
FALLBACK_PATH = "#{RESOURCES_PATH}/audio/fallback.mp3"

ALLOWED_METADATA_KEYS = ["title", "artist"]

### Utils

def get_env(~default="", key) =
  list.assoc(default=default, key, environment())
end

def filter_metadata(keys, source) =
  predicate = fun (md) -> list.mem(fst(md), keys)

  metadata.map(
    update=false, strip=true, fun (md) -> list.filter(predicate, md), source
  )
end

### Variables

server_host = get_env(default="0.0.0.0", "FUSION__SERVER__HOST")
server_port = int_of_string(get_env(default="9000", "FUSION__SERVER__PORT"))
streamcast_icy_host =
  get_env(default="localhost", "FUSION__STREAMCAST__ICY__HOST")
streamcast_icy_port =
  int_of_string(get_env(default="8000", "FUSION__STREAMCAST__ICY__PORT"))
streamcast_icy_user = get_env(default="source", "FUSION__STREAMCAST__ICY__USER")
streamcast_icy_password =
  get_env(default="password", "FUSION__STREAMCAST__ICY__PASSWORD")
streamcast_icy_mount =
  get_env(default="radio.mp3", "FUSION__STREAMCAST__ICY__MOUNT")

### Inputs

music = single(FALLBACK_PATH)

live =
  input.srt(
    bind_address=server_host,
    port=server_port,
    read_timeout=null(),
    write_timeout=null()
  )
live = buffer(live)

### Stream

radio = fallback(track_sensitive=false, [live, music])
radio = filter_metadata(ALLOWED_METADATA_KEYS, radio)
radio = mksafe(radio)

### Outputs

output.icecast(
  %mp3,
  host=streamcast_icy_host,
  port=streamcast_icy_port,
  user=streamcast_icy_user,
  password=streamcast_icy_password,
  mount=streamcast_icy_mount,
  icy_metadata=ALLOWED_METADATA_KEYS,
  icy_song=fun (_) -> null(),
  radio
)
