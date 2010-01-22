class Object
  
  def self.comparable_by_alphabet(alphabet, &block)
    if block
      define_method :"<=>" do |other|
        block[self].to_s.compare_by_alphabet(block[other].to_s, alphabet)
      end
    else
      define_method :"<=>" do |other|
        self.to_s.compare_by_alphabet(other.to_s, alphabet)
      end
    end    
  end
  
end