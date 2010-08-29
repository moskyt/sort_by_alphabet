# encoding: utf-8

class Alphabet
  
  def self.compare_letters(x, y)
    i = letters.mb_chars.index(x)
    j = letters.mb_chars.index(y)
    if i && j
      i <=> j
    else
      x.mb_chars.normalize(:d) <=> y.mb_chars.normalize(:d)
    end
  end
  
  def self.by_locale(locale)
    language = locale.split('-').first.downcase
    case language
      when 'cs'
        CzechAlphabet
      when 'en'
        EnglishAlphabet
      else
        raise "Language #{language} of locale #{locale} is unknown."
    end
  end
  
end

class CzechAlphabet < Alphabet
  
  def self.letters
    "AÁBCČDĎEÉĚFGHIÍJKLMNŇOÓPQRŘSŠTŤUÚŮVWXYÝZŽaábcčdďeéěfghiíjklmnňoópqrřsštťuúůvwxyýzž"
  end
  
end

class EnglishAlphabet < Alphabet
  
  def self.letters
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklnopqrstuvwxyz"
  end
  
end