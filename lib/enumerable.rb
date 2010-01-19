module Enumerable
  
  def sort_by_alphabet(alphabet)
    sort{|a, b| a.compare_by_alphabet_sensitive(b, alphabet)}
  end

  def isort_by_alphabet(alphabet)
    sort{|a, b| a.compare_by_alphabet_insensitive(b, alphabet)}
  end

end
