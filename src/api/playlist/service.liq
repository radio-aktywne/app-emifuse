let api.playlist.service = {}

def api.playlist.service.get() =
  playlist = state().playlist
  null.case(
    playlist,
    fun () ->
      error.raise(
        api.playlist.errors.notfound,
        "Playlist data not found."
      ),
    fun (p) -> api.playlist.models.getresponse.create(id=p.id)
  )
end

def api.playlist.service.put(request) =
  playlist = {id=request.id}

  s = state()
  let s.playlist = playlist
  state := s

  api.playlist.models.putresponse.create(id=playlist.id)
end
