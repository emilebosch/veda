require 'sinatra/base'

module Veda
	class Server < Sinatra::Base
		get '/' do
			"It was acceptable in the 80's"
		end
	end
end