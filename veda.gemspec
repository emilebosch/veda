Gem::Specification.new do |s|
  s.name        = 'veda'
  s.version     = '0.0.0.0'
  s.date        = '2013-10-01'
  s.summary     = "Veda"
  s.description = "Collaborative git based documentation"
  s.authors     = ["Emile Bosch"]
  s.email       = 'emilebosch@me.com'
  s.files        = Dir.glob('{lib}/**/*') + %w(README.md)
  s.homepage    = 'https://github.com/emilebosch/veda'
  s.license     = 'MIT'
  s.executables << 'veda'

  s.add_dependency 'sinatra'
  s.add_dependency 'rdiscount'
  s.add_dependency 'thor'
  s.add_dependency 'slim'
  s.add_dependency 'hashie'
  s.add_dependency 'git'
end