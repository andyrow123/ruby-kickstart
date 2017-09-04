# You'll get a string and a boolean.
# When the boolean is true, return a new string containing all the odd characters.
# When the boolean is false, return a new string containing all the even characters.
# 
# If you have no idea where to begin, remember to check out the cheatsheets for string and logic/control
# 
# odds_and_evens("abcdefg",true)    # => "bdf"
# odds_and_evens("abcdefg",false)   # => "aceg"

def odds_and_evens(string, return_odds)
  result = ''
  str_array = string.chars
  if return_odds
    str_array.each_with_index {|char, index|
      result << char if index.odd?
    }
  else
    str_array.each_with_index {|char, index|
      result << char if index.even?
    }
  end
  result
end

