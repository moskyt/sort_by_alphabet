module SortByAlphabet

  module InstanceMethods

    def compare_by_alphabet(other, alphabet)
      if RUBY_VERSION.to_f < 1.9
        l1 = self.mb_chars.length
        l2 = other.mb_chars.length
        (0...[l1, l2].min).each do |i|
          c = alphabet.compare_letters(self.mb_chars[i..i], other.mb_chars[i..i])
          return c unless c == 0
        end
      else
        l1 = self.length
        l2 = other.length
        (0...[l1, l2].min).each do |i|
          c = alphabet.compare_letters(self[i..i], other[i..i])
          return c unless c == 0
        end
      end
      l1 <=> l2
    end

  end

end