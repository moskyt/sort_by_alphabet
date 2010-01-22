require 'test/unit'

require 'rubygems'
require 'active_support'

$KCODE = "u"

require "#{File::dirname __FILE__}/../init"

class SomeObject
  
  comparable_by_alphabet(CzechAlphabet) {|obj| obj.s}
  
  attr_reader :s
  
  def initialize(s)
    @s = s
  end
  
end

class OtherObject
  
  comparable_by_alphabet(Alphabet.by_locale('cs-CZ'))
  
  def to_s
    @s.mb_chars.downcase
  end
  
  def initialize(s)
    @s = s
  end
  
end


class TestSorting < Test::Unit::TestCase
  
  def test_letter_comparison
    assert_equal -1, CzechAlphabet.compare_letters('a', 'č')
    assert_equal -1, CzechAlphabet.compare_letters('č', 'š')
    assert_equal -1, CzechAlphabet.compare_letters('š', 'z')
    assert_equal -1, CzechAlphabet.compare_letters('z', 'ž')
    
    assert_equal +1, CzechAlphabet.compare_letters('ž', 'f')
    assert_equal +1, CzechAlphabet.compare_letters('f', 'á')
    assert_equal +1, CzechAlphabet.compare_letters('á', 'R')
    assert_equal +1, CzechAlphabet.compare_letters('R', 'Ď')
    assert_equal +1, CzechAlphabet.compare_letters('Ď', 'D')
    assert_equal +1, CzechAlphabet.compare_letters('D', 'A')
  end
  
  def test_string_comparison
    assert_equal -1, CzechAlphabet.compare_letters('h', 'ň')
    assert_equal -1, "haf".compare_by_alphabet("ňaf", CzechAlphabet)
    assert_equal -1, "Auto".compare_by_alphabet("Čuník", CzechAlphabet)
    assert_equal -1, "vir".compare_by_alphabet("výr", CzechAlphabet)
    assert_equal -1, "Nautilus".compare_by_alphabet("nýmand", CzechAlphabet)

    assert_equal +1, "šumák".compare_by_alphabet("stoupa", CzechAlphabet)
    assert_equal +1, "Ábele".compare_by_alphabet("Ábel", CzechAlphabet)
    assert_equal +1, "dědek".compare_by_alphabet("činže", CzechAlphabet)
  end
  
  def test_explicit_sort
    assert_equal %w{auto čeněk dub švihov zavináč}, %w{dub čeněk auto švihov zavináč}.sort_by_alphabet(CzechAlphabet)
    x1, x2, x3 = SomeObject.new('čára'), SomeObject.new('sup'), SomeObject.new('žlababa')
    assert_equal [x1, x2, x3], [x3, x1, x2].sort
    x1, x2, x3 = OtherObject.new('ďoura'), OtherObject.new('SLON'), OtherObject.new('úpěnlivý')
    assert_equal [x1, x2, x3], [x3, x1, x2].sort
  end
  
end