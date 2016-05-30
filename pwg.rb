#!/usr/bin/env ruby
require "./optionparser"

Version = [0,0,1]

# Generate password based on given arguments
class PasswordGenerator
  ABCL = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z).freeze
  ABCU = ABCL.map(&:upcase).freeze
  NUMS = %w(0 1 2 3 4 5 6 7 8 9).freeze
  SPECCHARS = %w(§ ' " + ! % / = ( ) , . - _ : ? < > { } [ ] # & @ *).freeze

  def genpass(length)
    arr = [ABCL, ABCU, NUMS, SPECCHARS]
    pass = []
    length.times do
      choosen_type = arr[rand(0..3)]
      chossen_char = choosen_type[rand(0..choosen_type.length - 1)]
      pass << chossen_char
    end
    pass.join('')
  end
end

options = OptparseExample.parse(ARGV)

if options[:length] > 0
  l = options[:length]
  pass = PasswordGenerator.new
  STDOUT.puts "#{l} char password: #{pass.genpass(l)}"
else
  STDOUT.puts <<-EOF
  Please provide password length: ruby pwg.rb [number]

  Usage:
    ruby pwg.rb 10

  Options:
    -u    characters (eg -u luns)
            l : lowercase
            u : uppercase
            n : numbers
            s : special characters
    -l    length (mininum: 1)

  EOF
  puts "Given argument: #{ARGV}"
end
