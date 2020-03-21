require 'json'

class Application
  def call(env)
    [200, headers, ['Hello World'.to_json]]
  end

  private

  def headers
    {
      'Content-Type' => 'application/json'
    }
  end
end
