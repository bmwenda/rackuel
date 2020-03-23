require_relative 'lib/joke'
require_relative 'lib/rackuel'

class Application < Rackuel
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
      response(200, HEADERS, render('index.html.erb'))
    when '/joke'
      joke = Joke.fetch
      response(200, HEADERS, render('joke.html.erb', { joke: joke }))
    else
      response(404, HEADERS, render('not_found.html.erb'))
    end
  end
end
