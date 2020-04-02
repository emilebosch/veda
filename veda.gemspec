require "./lib/veda/version"

Gem::Specification.new do |s|
  s.name = "veda"
  s.version = Veda::VERSION
  s.date = "2013-10-01"
  s.summary = "Veda"
  s.description = "Collaborative git based documentation"
  s.authors = ["Emile Bosch"]
  s.email = "emilebosch@me.com"
  s.files = Dir.glob("{lib}/**/*") + %w(README.md config.ru veda.gemspec Gemfile)
  s.homepage = "https://github.com/emilebosch/veda"
  s.license = "MIT"
  s.executables << "veda"

  s.add_dependency "sinatra"
  s.add_dependency "thor"
  s.add_dependency "slim"
  s.add_dependency "hashie"
  s.add_dependency "git"
  s.add_dependency "sinatra-contrib"
  s.add_dependency "coderay"
  s.add_dependency "redcarpet"
  s.add_dependency "bundler"

  s.add_development_dependency "minitest"
  s.add_development_dependency "rake"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-shell"
end
