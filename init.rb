require "#{File::dirname __FILE__}/lib/alphabets"
require "#{File::dirname __FILE__}/lib/enumerable"
require "#{File::dirname __FILE__}/lib/object"
require "#{File::dirname __FILE__}/lib/sort_by_alphabet"

String.send(:include, SortByAlphabet::InstanceMethods)
