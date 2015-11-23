Gem::Specification.new do |s|
  s.name        = 'after_commit_helper'
  s.version     = '0.0.2'
  s.date        = '2015-11-22'
  s.summary     = 'AfterCommitHelper'
  s.description = 'Conditionally execute after_commit for ActiveRecord'
  s.authors     = ['Gregory Hodum']
  s.email       = 'gregory.hodum@yahoo.com'
  s.files       = ['lib/after_commit_helper.rb']
  s.homepage    = 'https://github.com/ghodum'
  s.license     = 'MIT'
  s.test_files = Dir['spec/**/*']

  s.add_runtime_dependency 'activerecord', '>= 3.2'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec'
end
