require 'git'
require 'YAML'
require 'Hashie'

module Veda
	class Documentation
		def initialize(directory = nil)
			@directory = directory
		end

		def settings
			@includes ||= Hashie::Mash.new(YAML::load(File.open("#{@directory}/settings.yml")))
		end

		def fetch(file)
			path = "#{@directory}/#{file}.md"

			contents = File.read path
			match = contents.match /---(.*?)---(.*)/m
			contents = match[2]
			pages = contents.split '<!-- break -->'

			yaml = YAML::load(match[1]).merge!(pages: pages, contents: contents, id: File.basename(file, '.md'))
			Hashie::Mash.new(yaml)
		end

		def collection
			files = Dir.glob "#{@directory}/*.md"
			files.collect { |file| fetch(File.basename(file,'.md')) }
		end
	end
end