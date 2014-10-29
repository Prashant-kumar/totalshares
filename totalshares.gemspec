Gem::Specification.new do |s|
  s.name        = 'totalshares'
  s.version     = '1.0.1'
  s.date        = '2014-10-26'
  s.summary     = "Find out the total no. of shares of a website or webpage."
  s.description = "Find out the total no. of shares of a website or webpage on all major social networks."
  s.authors     = ["Prashant Kumar"]
  s.email       = 'prashant.kumar.312@gmail.com'
  s.files       = Dir.glob(["lib/*", "examples/*"])
  s.add_runtime_dependency 'typhoeus', '~> 0.6', '>= 0.6.9'
  s.add_runtime_dependency 'anemone', '~> 0.7', '>= 0.7.2'
  s.homepage    = 'https://github.com/Prashant-kumar/totalshares'
  s.license       = 'MIT'
end