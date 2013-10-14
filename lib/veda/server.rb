require 'sinatra/base'
require "sinatra/reloader"
require 'slim'
require 'coderay'
require 'redcarpet'

module Veda
 class MarkdownRenderer < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.highlight(code, language || 'none')
    end
  end

  module Helpers
    def date(date)
      date.strftime('%b %e, %Y')
    end

    def markdown(text)
      rndr = MarkdownRenderer.new(:filter_html => true, :hard_wrap => true)
      options = {
        :fenced_code_blocks => true,
        :no_intra_emphasis => true,
        :autolink => true,
        :strikethrough => true,
        :lax_html_blocks => true,
        :superscript => true
      }
      markdown_to_html = Redcarpet::Markdown.new(rndr, options)
      markdown_to_html.render(text)
    end

    def gravatar(email)
      gravatar_id = Digest::MD5.hexdigest(email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png"
    end
  end

	class Server < Sinatra::Base
    helpers Veda::Helpers
    register Sinatra::Reloader if development?

    def initialize(path=nil, repo=nil)
      @documentation = Veda::Documentation.new(path, repo)
      super()
    end

		get '/' do
      slim :index
		end

    get '/:file' do
      @page = @documentation.fetch params[:file]
      slim :show
    end
	end

  class Library < Sinatra::Base
    register Sinatra::Reloader if development?

    def initialize(path=nil, repo=nil)
      @documentation = Veda::Documentation.new(path, repo)
      super()
    end

    get '/' do
      @files = Dir.glob("#{home}/*/*").collect { |f| f.gsub home, ''  }
      slim :library
    end

    get '/*' do
      parts = env['PATH_INFO'].split('/').reject(&:empty?)
      return unless parts.length >= 2

      dir = "#{parts[0]}/#{parts[1]}"

      env['PATH_INFO'] = env['PATH_INFO'].gsub(dir,'')
      env['SCRIPT_NAME'] = dir

      path = File.join(home, dir)

      Dir.chdir(path)
      Server.new.call(env)
    end

    private

    def home
      "#{Dir.home}/.veda/Library"
    end
  end
end