require 'thor'

module Veda
	class Cli < Thor
    default_task :start

	  desc "start", "Start the veda webserver"
	  def start
	  	Veda::Server.run!
	  end

    desc "install [REPO]","Install and view documentation from github"
    def view(repo)

      path = "#{Dir.home}/.veda/library/#{repo}"

      unless File.exist? path
        `mkdir -p #{path}`
        `git clone git@github.com:#{repo}.git #{path}`
      end

      Dir.chdir(path)
      Veda::Server.run!
    end
	end
end