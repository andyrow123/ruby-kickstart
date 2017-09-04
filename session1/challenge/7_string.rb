# given a string, return the character after every letter "r"
# 
# pirates_say_arrrrrrrrr("are you really learning Ruby?") # => "eenu"
# pirates_say_arrrrrrrrr("Katy Perry is on the radio!")   # => "rya"
# pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr")        # => "arrrrrrrr"

def pirates_say_arrrrrrrrr(string)
  result = ''
  str_array = string.downcase.chars
  str_array.each_with_index {|char, index |
    result << str_array[index + 1] if char == 'r' && str_array[index + 1] != nil
  }
  result
end
