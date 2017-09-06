# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method 
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.
class BeerSong
  @@numbers = {
      0 => 'zero',
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      10 => 'ten',
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen',
      20 => 'twenty',
      30 => 'thirty',
      40 => 'forty',
      50 => 'fifty',
      60 => 'sixty',
      70 => 'seventy',
      80 => 'eighty',
      90 => 'ninety'
  }

  def initialize(bottles)
    @bottles = check_bottles(bottles)
  end

  def print_song
    while @bottles != 0
      verse
      @bottles -= 1
    end
  end

  def num_to_text(int)
    str = ""
    if @@numbers.has_key?int
      str = str + @@numbers[int]
    else
      str_arr = int.to_s.split(//)
      while str_arr.size > 0
        if str_arr.size == 2
          str << @@numbers[int - int%10] + '-'
          str_arr.shift
        elsif str_arr.size == 1
          str << @@numbers[int%10]
          str_arr.shift
        end
      end
    end
    str
  end

  def verse
    puts "#{num_to_text(@bottles).capitalize} bottles of beer on the wall,", "#{num_to_text(@bottles).capitalize} bottles of beer,", "Take one down, pass it around,", "#{num_to_text(@bottles - 1).capitalize} bottles of beer on the wall." if @bottles > 2
    puts "#{num_to_text(@bottles).capitalize} bottles of beer on the wall,", "#{num_to_text(@bottles).capitalize} bottles of beer,", "Take one down, pass it around,", "#{num_to_text(@bottles - 1).capitalize} bottle of beer on the wall." if @bottles == 2
    puts "#{num_to_text(@bottles).capitalize} bottle of beer on the wall,", "#{num_to_text(@bottles).capitalize} bottle of beer,", "Take one down, pass it around,", "#{num_to_text(@bottles - 1).capitalize} bottles of beer on the wall." if @bottles == 1
  end

  private

  def check_bottles(bottles)
    return 0 if bottles < 0
    return 99 if bottles > 99
    return bottles if bottles >= 0
  end

end

song_1 = BeerSong.new 100
song_1.print_song