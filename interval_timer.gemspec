require 'interval_timer/version'

Gem::Specification.new do |s|
  s.name = 'interval_timer'
  s.summary = 'Code profiling tool that lets you track how long things take.'
  s.description = s.summary + ' Start a timer and check in from points in your code.  Prints a report of the time elapsed between those points in the code.'

  s.version = IntervalTimer::Version

  s.date = '2017-07-20'

  s.authors = [ 'Luke Griffiths' ]
  s.email = 'lgcboulder@gmail.com'
  s.homepage = 'https://rubygems.org/gems/interval_timer'
  s.license = 'MIT'

  s.files = [ 'lib/interval_timer.rb' ]

  s.add_development_dependency 'rspec', '~> 3'
  s.add_development_dependency 'pry', '~> 0'
end
