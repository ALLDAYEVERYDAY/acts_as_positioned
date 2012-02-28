$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_positioned/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_positioned"
  s.version     = ActsAsPositioned::VERSION
  s.authors     = ["Chris Frank"]
  s.email       = ["chris@alldayeveryday.com"]
  s.homepage    = "http://alldayeveryday.com"
  s.summary     = "Stuff should stay where you put it."
  s.description = "ActsAsPositioned a featherweight module for keeping records organized by position."

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "README.md"]
  #s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1"

  s.add_development_dependency "sqlite3"
end
