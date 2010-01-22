module Enumerable
  
  def sort_by_alphabet(alphabet)
    if block_given?
      sort{|a, b| yield(a).to_s.compare_by_alphabet(yield(b).to_s, alphabet)}
    else
      sort{|a, b| a.to_s.compare_by_alphabet(b.to_s, alphabet)}
    end
  end

end
