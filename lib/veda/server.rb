module Veda
  class Server < Sinatra::Base
    helpers Veda::Helpers
    register Sinatra::Reloader if development?

    def initialize(path = nil, repo = nil)
      @documentation = Veda::Documentation.new(path, repo)
      super()
    end

    get "/" do
      slim :index
    end

    get "/:file" do
      @page = @documentation.fetch params[:file]
      slim :show
    end
  end
end
