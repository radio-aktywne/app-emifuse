let utils.metadata = {}

def utils.metadata.filter(keys, source) =
  def predicate(md) =
    list.mem(fst(md), keys)
  end

  def filter(md) =
    list.filter(predicate, md)
  end

  metadata.map(update=false, strip=true, filter, source)
end
