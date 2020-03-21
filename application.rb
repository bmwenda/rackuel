require_relative 'lib/joke'
require_relative 'utils/renderer'

class Application
  HEADERS = {
    'Content-Type' => 'text/html'
  }.freeze

  def call(env)
    route_path(env)
  end

  private

  def route_path(env)
    case env['REQUEST_PATH']
    when '/'
      [200, HEADERS, [Utils::Renderer.new('index.html.erb').render]]
    when '/joke'
      joke = Joke.fetch
      [200, HEADERS, [Utils::Renderer.new('joke.html.erb', { joke: joke }).render]]
    else
      [404, HEADERS, [Utils::Renderer.new('not_found.html.erb').render]]
    end
  end
end
