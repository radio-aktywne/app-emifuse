### Constants

SOURCE_PATH = "src"
RESOURCES_PATH = "#{SOURCE_PATH}/resources"
FALLBACK_PATH = "#{RESOURCES_PATH}/audio/fallback.mp3"

TYPE_KEY = "type"
TYPE_LIVE = "live"
TYPE_PLAYLIST = "playlist"

SOURCE_CROSS_DURATION = 2.
LIVE_BUFFER_LENGTH = SOURCE_CROSS_DURATION + 0.1

TARGET_METADATA = ["title", "artist"]

### Utils

def get_env(~default="", key) =
    list.assoc(default=default, key, environment())
end

def tag_type(~key=TYPE_KEY, ~type) =
    [(key, type)]
end

def add_metadata(md, source) =
    metadata.map(
        update=true,
        strip=true,
        fun(_) -> md,
        source
    )
end

def keep_metadata(keys, source) =
    predicate = fun(md) -> list.mem(fst(md), keys)

    metadata.map(
        update=false,
        strip=true,
        fun(md) -> list.filter(predicate, md),
        source
    )
end

def simple_cross(~duration, a, b) =
    cross.simple(fade_in=duration, fade_out=duration, a.source, b.source)
end

### Transitions

def between_tracks(a, b) =
    sequence([a.source, b.source])
end

def live_in(~duration, a, b) =
    simple_cross(duration=duration, a, b)
end

def live_out(~duration, a, b) =
    simple_cross(duration=duration, a, b)
end

# Called by cross
# when there should be a transition between tracks on one stream
# or between different streams
def transition(~duration, a, b) =
    if a.metadata[TYPE_KEY] == TYPE_LIVE then
        live_out(duration=duration, a, b)
    elsif b.metadata[TYPE_KEY] == TYPE_LIVE then
        live_in(duration=duration, a, b)
    else
        between_tracks(a, b)
    end
end

### Variables

source_live_port = int_of_string(get_env(default="9000", "FUSION_SOURCE_LIVE_PORT"))
target_icecast_host = get_env(default="localhost", "FUSION_TARGET_ICECAST_HOST")
target_icecast_port = int_of_string(get_env(default="8000", "FUSION_TARGET_ICECAST_PORT"))
target_icecast_user = get_env(default="source", "FUSION_TARGET_ICECAST_USER")
target_icecast_password = get_env(default="password", "FUSION_TARGET_ICECAST_PASSWORD")
target_icecast_mount = get_env(default="radio.mp3", "FUSION_TARGET_ICECAST_MOUNT")

### Inputs

music = single(FALLBACK_PATH)
music = add_metadata(tag_type(type=TYPE_PLAYLIST), music)

live = input.srt(port=source_live_port)
live = add_metadata(tag_type(type=TYPE_LIVE), live)
live = source(source.tracks(live))
live = buffer(buffer=LIVE_BUFFER_LENGTH, fallible=true, live)

### Stream

radio = fallback(track_sensitive=false, [live, music])
# Crossing inspiration:
# https://github.com/savonet/liquidsoap/issues/746#issuecomment-667680083
# https://github.com/savonet/liquidsoap/issues/695#issuecomment-459973359
radio = cross(
    duration=SOURCE_CROSS_DURATION,
    fun(a, b) -> transition(duration=SOURCE_CROSS_DURATION, a, b),
    radio
)
radio = keep_metadata(TARGET_METADATA, radio)
radio = mksafe(radio)

### Outputs

output.icecast(
    %mp3,
    host=target_icecast_host,
    port=target_icecast_port,
    user=target_icecast_user,
    password=target_icecast_password,
    mount=target_icecast_mount,
    icy_metadata=TARGET_METADATA,
    icy_song=fun(_) -> null(),
    radio
)
