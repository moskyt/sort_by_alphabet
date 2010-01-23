require 'rubygems' unless defined?(Gem)
s = Gem::Specification.new do |s|
  s.name = "sort-by-alphabet"
  s.version = "0.2.1"
  s.summary = "Library for lexical sorting in various languages."
  s.author = "Frantisek Havluj"
  s.email = "moskyt@rozhled.cz"
  s.homepage = "http://github.com/moskyt/sort-by-alphabet"
  s.has_rdoc = false
 
  s.files = Dir['lib/**/*'] + %w{
    init.rb
    README.textile
    MIT-LICENSE
    CHANGELOG
  }
   
  # s.extensions << 'extconf.rb'
  # s.test_file = 'test.rb'
end