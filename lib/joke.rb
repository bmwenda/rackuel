require 'json'
require 'net/http'

class Joke
  class << self
    def fetch
      response = JSON.parse(fetch_joke)
      unless response['status'] == 200
        return 'Congratulations! You have failed successfully'
      end

      response['joke']
    end

    private

    def fetch_joke
      uri = URI('https://icanhazdadjoke.com/')
      request = Net::HTTP::Get.new(uri)
      request['Accept'] = 'application/json'

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |https|
        https.request(request)
      end
      response.body
    end
  end
end
