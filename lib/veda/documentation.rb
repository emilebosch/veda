require 'yaml'
require 'hashie'

module Veda
  class Documentation

    def initialize(directory = nil, repo = nil)
      @directory = directory
      @repo = repo
    end

    def fetch(file)
      path = make_path("#{file}.md")

      data = {}
      contents = File.read path
      match = contents.match /---(.*?)---(.*)/m
      if match
        data = YAML::load(match[1])
        contents = match[2]
      end

      if data['title'].nil?
        match = contents.match /^##* ?(.+)$/
        if match
          data['title'] = match[1]
        else
          data['title'] = file
        end
      end

      pages = contents.split '<!-- break -->'
      scm_file = ScmFile.new @repo, path

      Hashie::Mash.new(data.merge!(pages: pages, scm_file: scm_file, contents: contents, id: File.basename(file, '.md')))
    end

    def make_path(file)
      @directory ? "#{@directory}/#{file}" : file
    end

    def collection
      files = Dir.glob make_path("*.md")
      files.collect { |file| fetch(File.basename(file,'.md')) }
    end

    def outline

    end
  end
end