module Veda
  class Library < Sinatra::Base
    register Sinatra::Reloader if development?

    get "/" do
      @files = Dir.glob("#{home}/*").collect { |f| f.gsub home, "" }
      slim :library
    end

    get "/*" do
      parts = env["PATH_INFO"].split("/").reject(&:empty?)
      return unless parts.length >= 2

      dir = "#{parts[0]}/#{parts[1]}"

      env["PATH_INFO"] = env["PATH_INFO"].gsub(dir, "")
      env["SCRIPT_NAME"] = dir

      path = File.join(home, dir)

      Dir.chdir(path)
      Server.new.call(env)
    end

    private

    def home
      "#{Dir.home}/.veda/library"
    end
  end
end
