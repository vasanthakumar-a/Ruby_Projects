def validate_bracket? bracket_array
  bracket_hash = {'('=>')','['=>']','{'=>'}'}
  store_brackets = []

  bracket_array.each_char do |bracket|

    if bracket_hash.has_key?(bracket)
      store_brackets<<bracket
    end

    if bracket_hash.has_value?(bracket)
      store_brackets.delete(bracket_hash.key(bracket))
    end
  end

  if store_brackets.empty?
    puts true
  else
    puts false
  end

end


validate_bracket?("(){}[])")       # True
validate_bracket?("([{}])")        # True
validate_bracket?("(}")            # False
validate_bracket?("[(])")          # False
validate_bracket?("[({})](]")      # False
