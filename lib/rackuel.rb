require_relative 'core/renderer'
require_relative 'core/response_handler'

class Rackuel
  include Core::Renderer
  include Core::ResponseHandler
end
