### constants

RESOURCE_PATH = "resources"
FALLBACK_PATH = "audio/fallback.mp3"

TYPE_KEY = "type"
TYPE_LIVE = "live"
TYPE_PLAYLIST = "playlist"

SOURCE_CROSS_DURATION = 2.
LIVE_BUFFER_LENGTH = SOURCE_CROSS_DURATION + 0.1

### utils

def get_env(~default="", key) =
    list.assoc(default=default, key, environment())
end

def resource(path) =
    "#{RESOURCE_PATH}/#{path}"
end

def tag_type(~key=TYPE_KEY, ~type) =
    [(key, type)]
end

def simple_cross(~duration, a, b) =
    cross.simple(fade_in=duration, fade_out=duration, a.source, b.source)
end

### transitions

def between_tracks(~duration, a, b) =
    sequence([a.source, b.source])
end

def live_in(~duration, a, b) =
    simple_cross(duration=duration, a, b)
end

def live_out(~duration, a, b) =
    simple_cross(duration=duration, a, b)
end

# called by cross
# when there should be a transition between tracks on one stream
# or between different streams
# a is track/stream that is ending, b is the starting one
def transition(~duration, a, b) =
    if a.metadata[TYPE_KEY] == TYPE_LIVE then
        live_out(duration=duration, a, b)
    elsif b.metadata[TYPE_KEY] == TYPE_LIVE then
        live_in(duration=duration, a, b)
    else
        between_tracks(duration=duration, a, b)
    end
end

### variables

live_port = int_of_string(get_env("FUSION_SOURCE_LIVE_PORT"))
target_icecast_host = get_env("FUSION_TARGET_ICECAST_HOST")
target_icecast_port = int_of_string(get_env("FUSION_TARGET_ICECAST_PORT"))
target_icecast_password = get_env("FUSION_TARGET_ICECAST_PASSWORD")
target_icecast_mount = get_env("FUSION_TARGET_ICECAST_MOUNT")

music_file = resource(FALLBACK_PATH)

### inputs

music = single(music_file)
music = metadata.map(
    insert_missing=false,
    fun(_) -> tag_type(type=TYPE_PLAYLIST),
    music
)

live = input.srt(port=live_port)
live = metadata.map(
    insert_missing=false,
    fun(_) -> tag_type(type=TYPE_LIVE),
    live
)
live = merge_tracks(live)
live = buffer(buffer=LIVE_BUFFER_LENGTH, fallible=true, live)

### stream

radio = fallback(track_sensitive=false, [live, music])
# crossing inspiration:
# https://github.com/savonet/liquidsoap/issues/746#issuecomment-667680083
# https://github.com/savonet/liquidsoap/issues/695#issuecomment-459973359
radio = cross(
    duration=SOURCE_CROSS_DURATION,
    fun(a, b) -> transition(duration=SOURCE_CROSS_DURATION, a, b),
    radio
)
radio = mksafe(radio)

### outputs

output.icecast(
    %mp3,
    host=target_icecast_host,
    port=target_icecast_port,
    password=target_icecast_password,
    mount=target_icecast_mount,
    radio
)
