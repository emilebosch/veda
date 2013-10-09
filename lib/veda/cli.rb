require 'thor'

module Veda
	class Cli < Thor
	  desc "start", "Start the veda webserver"
	  def start
	  	Veda::Server.run!
	  end

    desc "install [REPO]","Install from github"
    def install(repo)
      puts repo
    end
	end
end