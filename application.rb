require 'json'

require_relative 'lib/joke'
class Application
  HEADERS = {
    'Content-Type' => 'application/json'
  }.freeze

  def call(env)
    route_path(env)
  end

  private

  def route_path(env)
    case env['REQUEST_PATH']
    when '/'
      [200, HEADERS, ['Hello World'.to_json]]
    when '/joke'
      joke = Joke.fetch
      [200, HEADERS, [joke.to_json]]
    else
      [404, HEADERS, ['404 Not Found'.to_json]]
    end
  end
end
