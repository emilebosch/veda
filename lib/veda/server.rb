require 'sinatra/base'
require 'slim'
require 'markdown'

module Veda
	class Server < Sinatra::Base

    helpers do
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

		get '/' do
      @documentation = Veda::Documentation.new(".")
      slim :index
		end

    get '/:file' do
      @documentation = Veda::Documentation.new(".")
      @page = @documentation.fetch params[:file]
      slim :show
    end

	end
end