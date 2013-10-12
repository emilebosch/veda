require 'thor'

module Veda
	class Cli < Thor
    default_task :start

	  desc "start", "Start the veda webserver"
	  def start
      start_server
	  end

    desc "install [REPO]", "Install and view documentation from github, i.e. `veda install emilebosch/guides`"
    def install(repo)
      path = library_path(repo)
      unless File.exist? path
        `mkdir -p #{path}`
        `git clone git@github.com:#{repo}.git #{path}`
      end
      Dir.chdir(path)
      start_server
    end

    desc "list","List locally installed vedas"
    def list
      for path in Dir.glob "#{library_path}*/*"
        base,name = path.split(library_path)
        puts name
      end
    end

    desc "update", "Update a locally installed veda"
    def update(repo)
      puts `cd #{library_path(repo)} && git pull`
    end

    private

    def start_server
      Veda::Server.run!
    end

    def library_path(guide=nil)
      path = "#{Dir.home}/.veda/library/#{guide}"
    end
	end
end