# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)

files = `git ls-files`.split("\n")
test_files = `git ls-files -- test/*`.split("\n")
ignores = `git ls-files -- .gitignore`.split("\n")

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = 'clarity'
  s.version = '0.9.8'
  s.platform = Gem::Platform::RUBY
  s.authors = ["Tobias Lütke", "John Tajima"]
  s.summary = "Web interface for grep and tail -f"

  s.files         = files - test_files - ignores
  s.test_files    = []
  s.require_paths = ['lib']
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  s.add_dependency 'eventmachine', '>= 0.12.10'
  s.add_dependency 'eventmachine_httpserver','>= 0.2.0'
  s.add_dependency 'json', '>= 1.0.0'
end
