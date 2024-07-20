let utils.metadata = {}

def utils.metadata.filter(keys, source) =
  predicate = fun (md) -> list.mem(fst(md), keys)

  metadata.map(
    update=false, strip=true, fun (md) -> list.filter(predicate, md), source
  )
end
