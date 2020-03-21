module Utils
  class Renderer
    BASE_DIR = 'views'.freeze

    def initialize(template)
      @template = template
    end

    def render
      content = File.read(File.join(BASE_DIR, template))
      ERB.new(content).result
    end

    private

    attr_reader :template
  end
end
