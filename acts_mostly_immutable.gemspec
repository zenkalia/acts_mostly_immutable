Gem::Specification.new do |s|
  s.name        = 'acts_mostly_immutable'
  s.version     = '0.0.0'
  s.date        = '2014-04-27'
  s.summary     = "Immutability is a way to make an object save versions."
  s.description = "It's a little weird."
  s.authors     = ["Mike Kendall"]
  s.email       = 'zenkalia@gmail.com'
  s.files       = ["lib/acts_mostly_immutable.rb"]
  s.homepage    = 'http://www.github.com/zenkaila/acts_mostly_immutable'
  s.license     = 'MIT'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'activerecord'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pry'
end
