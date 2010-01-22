module SortByAlphabet
    
  module InstanceMethods
        
    def compare_by_alphabet(other, alphabet)
      l1 = self.mb_chars.length
      l2 = other.mb_chars.length
      (0...[l1, l2].min).each do |i|
        c = alphabet.compare_letters(self.mb_chars[i..i], other.mb_chars[i..i])
        return c unless c == 0
      end
      l1 <=> l2
    end
    
  end
  
end