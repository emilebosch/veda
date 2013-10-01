require 'thor'

module Veda
	class CLI < Thor
	  desc "start", "Start the veda webserver"
	  def start
	  	require 'server'
	  	Veda::Server.run!
	  end
	end
end