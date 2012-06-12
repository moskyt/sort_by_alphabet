require "#{File::dirname __FILE__}/lib/alphabets"
require "#{File::dirname __FILE__}/lib/enumerable"
require "#{File::dirname __FILE__}/lib/object"
require "#{File::dirname __FILE__}/lib/sort_by_alphabet"

if RUBY_VERSION.to_f >= 1.9
  class String
    def mb_chars
      self
    end
  end
else
  unless String.instance_methods.include? :mb_chars
    raise "mb_chars support is required for Ruby 1.8."
  end
end

unless String.instance_methods.include? :normalize
  class String
    def normalize(*args)
      self
    end
  end
end

String.send(:include, SortByAlphabet::InstanceMethods)
