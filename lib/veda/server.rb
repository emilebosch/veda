require 'sinatra/base'
require 'sinatra/content_for'
require 'slim'
require 'markdown'

module Veda

  module Helpers

    def date(date)
      date.strftime('%b %e, %Y')
    end

    def markdown(content)
      Markdown.new(content).to_html
    end

    def gravatar(email)
      gravatar_id = Digest::MD5.hexdigest(email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png"
    end
  end

	class Server < Sinatra::Base

    helpers Sinatra::ContentFor
    helpers Veda::Helpers

    def initialize(path=nil, repo=nil)
      @documentation = Veda::Documentation.new(path, repo)
      super()
    end

		get '/' do
      slim :index
		end

    get '/:file' do
      @page = @documentation.fetch params[:file]
      slim :show
    end
	end
end