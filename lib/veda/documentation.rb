require 'yaml'
require 'hashie'

module Veda
  class Documentation

    def initialize(directory = nil)
      @directory = directory
    end

    def fetch(file)
      path = "#{@directory}/#{file}.md"
      contents = File.read path

      authors = Git.authors path
      log = Git.log path

      data = {}
      match = contents.match /---(.*?)---(.*)/m
      if match
        data = YAML::load(match[1])
        contents = match[2]
      end

      pages = contents.split '<!-- break -->'
      Hashie::Mash.new(data.merge!(pages: pages, authors: authors, log:log, contents: contents, id: File.basename(file, '.md')))
    end

    def collection
      files = Dir.glob "#{@directory}/*.md"
      files.collect { |file| fetch(File.basename(file,'.md')) }
    end
  end
end