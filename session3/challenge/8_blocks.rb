# This problem is based off of example 2
# Modify it so that it also tracks a person's age and a quote
# Allow any of these to be set with a hash as well, but the block should overwrite the hash
#
#
# EXAMPLE:
#
# artist = Person.new :name => 'Prince' do |person|
#   person.age   = 47
#   person.quote = "Why don't you purify yourself in the waters of Lake Minnetonka?"
# end
#
# artist.name   # => "Prince"
# artist.age    # => 47
#
# artist.name = 'The Artist Formarly Known As Prince'
# artist.age  = 1999
#
# artist.name   # => "The Artist Formarly Known As Prince"
# artist.age    # => 1999
#
# artist.reinit
#
# artist.name   # => "The Artist Formarly Known As Prince"
# artist.age    # => 47
require 'date'

class Person
  attr_accessor :name, :age, :birthday, :quote

  def initialize(options={}, &initializer)
    self.name = options[:name]
    self.age  = options[:age]
    self.birthday = options[:birthday]
    self.quote  = options[:quote]

    # this way, it always has a proc, and code like reinit doesn't have to worry that it might not be there
    @initializer = (initializer || Proc.new {|person|})

    reinit
  end

  def reinit
    @initializer.call(self)
  end
end

austin = Person.new :name => 'Austin', :birthday => Date.parse('1979/09/16'), :age => 37 do |person|
  # person.name = 'Austin'
  # person.age = 37
  # person.birthday = Date.parse('1979/09/16')
  person.quote = "Blah blah blah!"
end

puts austin.name
puts austin.age
puts austin.birthday
puts austin.quote