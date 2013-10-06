module Veda
	class Cli < Thor
	  desc "start", "Start the veda webserver"
	  def start
	  	Veda::Server.run!
	  end
	end
end