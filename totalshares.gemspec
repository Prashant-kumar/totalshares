Gem::Specification.new do |s|
  s.name        = 'totalshares'
  s.version     = '1.0.0'
  s.date        = '2014-10-26'
  s.summary     = "Find out the total no. of shares of a website or webpage."
  s.description = "Find out the total no. of shares of a website or webpage on all major social networks."
  s.authors     = ["Prashant Kumar"]
  s.email       = 'prashant.kumar.312@gmail.com'
  s.files       = Dir.glob(["lib/*"])
  s.add_runtime_dependency 'typhoeus', '~> 0.6.9'
  s.homepage    = 'http://rubygems.org/gems/totalshares'
  s.license       = 'MIT'
end