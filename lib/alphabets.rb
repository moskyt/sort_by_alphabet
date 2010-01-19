class Alphabet
  
  def self.compare_letters_sensitive(x, y)
    i1 = lower_case.index(x)
    i2 = upper_case.index(x)
    j1 = lower_case.index(y)
    j2 = upper_case.index(y)
    if !i1 && !i2 or !j1 && !j2
      x <=> y
    elsif i1 && j2
      -1
    elsif i2 && j1
      +1
    elsif i1 && j1
      i1 <=> j1
    elsif i2 && j2
      i2 <=> j2
    else
      raise "I did not think of something"
    end
  end

  def self.compare_letters_insensitive(x, y)
    i = lower_case.index(letter_to_lowercase(x))
    j = lower_case.index(letter_to_lowercase(y))
    if !i || !j
      x <=> y
    else
      i <=> j
    end
  end
  
  def self.letter_to_lowercase(a)
    i = upper_case.index(a)
    if i
      lower_case[i] 
    else
      a
    end
  end
  
end

class CzechAlphabet < Alphabet
  
  def self.lower_case
    "aábcčdďeéěfghiíjklmnňoópqrřsštťuúůvwxyýzž"
  end
  
  def self.upper_case
    "AÁBCČDĎEÉĚFGHIÍJKLMNŇOÓPQRŘSŠTŤUÚŮVWXYÝZŽ"
  end
  
end