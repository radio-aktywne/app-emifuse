let api.schema.service = {}

def api.schema.service.get =
  source = "openapi/schema.yaml"
  target = "openapi/schema.html"

  cached = ref("")

  def handle() =
    current = file.contents(source)

    if
      not file.exists(target) or current != cached()
    then
      if
        process.test(
          process.quote.command(
            args=["build-docs", "--output", target, source], "redocly"
          )
        )
      then
        cached := current
      else
        error.raise(
          api.schema.errors.generate,
          "Failed to generate schema."
        )
      end
    end

    file.contents(target)
  end

  handle
end
