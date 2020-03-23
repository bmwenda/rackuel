module Core
  module Renderer
    BASE_DIR = 'views'.freeze

    def render(template, vars = {})
      b = binding
      joke = vars[:joke]
      content = File.read(File.join(BASE_DIR, template))
      ERB.new(content).result(b)
    end
  end
end
