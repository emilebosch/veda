require 'thor'
require 'server'

module Veda
	class CLI < Thor
	  desc "start", "Start the veda webserver"
	  def start
	  	Veda::Server.run!
	  end
	end
end