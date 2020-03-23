module Utils
  module ResponseHandler
    def response(status, headers, body = '')
      [status, headers, [body]]
    end
  end
end
