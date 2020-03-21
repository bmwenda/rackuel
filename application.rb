require_relative 'lib/joke'

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
      [200, HEADERS, ['<html><body><h2>Hello World</h2></body></html>']]
    when '/joke'
      joke = Joke.fetch
      [200, HEADERS, ["<html><body><b><em>#{joke}</em></b></body></html>"]]
    else
      [404, HEADERS, ['<html><body><h4>404 Not Found</h4></body></html>']]
    end
  end
end
