require 'git'

module Veda
  class Scm
    class << self
      def authors(file = nil)
        log(file)
          .sort_by  { |x| x[:date] }
          .reverse
          .group_by { |x| x[:author] }
      end

      def log(file = nil)
        g = Git.open('.')
        a = g.log(20).object(file)
        a.collect { | c | { rev: c.sha[0,7], author: c.author.name, email: c.author.email, comment: c.message, date: c.date } }
      end
    end
  end
end