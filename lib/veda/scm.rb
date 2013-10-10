require 'git'

module Veda
  class ScmFile
    def initialize(repo, file)
      @git = Git.open(repo)
      @log = @git.log(20).object(file)
    end

    def log
      @log.collect { | c |  Hashie::Mash.new({ rev: c.sha[0,7], author: c.author.name, email: c.author.email, comment: c.message, date: c.date }) }
    end

    def authors
      log.sort_by  { |x| x[:date] }
      .reverse
      .group_by { |x| x[:author] }
    end
  end
end