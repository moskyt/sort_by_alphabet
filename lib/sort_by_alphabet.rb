module SortByAlphabet
  
  module ClassMethods

  end
  
  module InstanceMethods
    def compare_by_alphabet_insensitive(other, alphabet)
      compare_by_alphabet(other, alphabet, :compare_letters_insensitive)
    end
    
    def compare_by_alphabet_sensitive(other, alphabet)
      compare_by_alphabet(other, alphabet, :compare_letters_sensitive)
    end
    
    def compare_by_alphabet(other, alphabet, method)
      l1 = self.mb_chars.length
      l2 = other.mb_chars.length
      (0...[l1, l2].min).each do |i|
        c = alphabet.send(method, self.mb_chars[i..i], other.mb_chars[i..i])
        return c unless c == 0
      end
      l1 <=> l2
    end
  end
  
end