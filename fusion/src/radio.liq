### constants

RESOURCE_PATH = "resources"
FALLBACK_PATH = "audio/fallback.mp3"

LIVE_PORT = 8000
LIVE_CONTENT_TYPE = "audio/ogg"

TYPE_KEY = "type"
TYPE_LIVE = "live"
TYPE_PLAYLIST = "playlist"

SOURCE_CROSS_DURATION = 5.
LIVE_BUFFER_LENGTH = 2. * SOURCE_CROSS_DURATION

### settings

# set ogg decoder priority higher than ffmpeg, see: https://github.com/savonet/liquidsoap/issues/1864#issuecomment-912957717
settings.decoder.priorities.ogg.set(15)

### utils

def get_env(~default="", key) =
  list.assoc(default=default, key, environment())
end

def resource(path) =
  "#{RESOURCE_PATH}/#{path}"
end

def tag_type(type, _) =
  [(TYPE_KEY, type)]
end

### transitions

def live_in(a, b) =
  add(normalize=false, [
      fade.out(duration=SOURCE_CROSS_DURATION, type="sin", a),
      fade.in(duration=SOURCE_CROSS_DURATION, type="sin", b)
    ])
end

def live_out(a, b) =
  add(normalize=false, [
      fade.out(duration=SOURCE_CROSS_DURATION, type="sin", a),
      fade.in(duration=SOURCE_CROSS_DURATION, type="sin", b)
    ])
end

# solution from https://github.com/savonet/liquidsoap/issues/746#issuecomment-667680083
def source_transition(a, b) =
  if a.metadata[TYPE_KEY] == TYPE_LIVE then
    live_out(a.source, b.source)
  elsif b.metadata[TYPE_KEY] == TYPE_LIVE then
    live_in(a.source, b.source)
  else
    sequence([a.source, b.source])
  end
end

### variables

decay_host = get_env("DECAY_HOST")
decay_port = int_of_string(get_env("DECAY_PORT"))
decay_password = get_env("DECAY_PASSWORD")
decay_mount = get_env("DECAY_MOUNT")

music_file = resource(FALLBACK_PATH)

### inputs

music = single(music_file)
music = map_metadata(tag_type(TYPE_PLAYLIST), music)

live = input.srt(port=LIVE_PORT, content_type=LIVE_CONTENT_TYPE)
live = map_metadata(tag_type(TYPE_LIVE), live)
live = buffer(buffer=LIVE_BUFFER_LENGTH, fallible=true, live)

### stream

radio = fallback(track_sensitive=false, [live, music])
radio = cross(duration=SOURCE_CROSS_DURATION, source_transition, radio)
radio = mksafe(radio)

### outputs

out = output.icecast(
  host=decay_host,
  port=decay_port,
  password=decay_password
)
out(%mp3, mount=decay_mount, radio)
