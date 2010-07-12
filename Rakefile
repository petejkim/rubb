require 'rake'
require 'rake/testtask'

begin
  require 'jeweler'
  
  Jeweler::Tasks.new do |s|
    s.name              = "rubb"
    s.summary           = "BBCode Parser for Ruby that supports nested BBCode tags."
    s.description       = s.summary
    s.homepage          = "http://github.com/petejkim/rubb"
    s.authors           = ["Peter Jihoon Kim"]
    s.email             = "raingrove@gmail.com"
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler - or one of its dependencies - is not available. " <<
  "Install it with: sudo gem install jeweler -s http://gemcutter.org"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = true
end

task :default => :test
