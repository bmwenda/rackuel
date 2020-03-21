module Utils
  class Renderer
    BASE_DIR = 'views'.freeze

    def initialize(template, vars = {})
      @template = template
      @vars = vars
    end

    def render
      b = binding
      joke = vars[:joke]
      content = File.read(File.join(BASE_DIR, template))
      ERB.new(content).result(b)
    end

    private

    attr_reader :template, :vars
  end
end
