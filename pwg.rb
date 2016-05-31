#!/usr/bin/env ruby
require './optionparser'

VERSION = [0, 0, 1].freeze

# Generate password based on given arguments
class PasswordGenerator
  L = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z).freeze
  U = L.map(&:upcase).freeze
  N = %w(0 1 2 3 4 5 6 7 8 9).freeze
  S = %w(§ ' " + ! % / = ( ) , . - _ : ? < > { } [ ] # & @ *).freeze

  def setcharset(charset)
    arr = []

    arr << L if charset.map(&:upcase).include?('L')
    arr << U if charset.map(&:upcase).include?('U')
    arr << N if charset.map(&:upcase).include?('N')
    arr << S if charset.map(&:upcase).include?('S')

    arr
  end

  def genpass(length, charset)
    arr = setcharset(charset)
    pass = []

    length.times do
      choosen_type = arr[rand(0..arr.length - 1)]
      chossen_char = choosen_type[rand(0..choosen_type.length - 1)]
      pass << chossen_char
    end
    pass.join('')
  end
end

options = Optparse.parse(ARGV)

if options[:length] > 0
  l = options[:length]
  c = options[:characterset]
  pass = PasswordGenerator.new
  STDOUT.puts "#{l} char password: #{pass.genpass(l, c)}"
else
  puts 'The given argument is not accepted. Try: ruby pwd.rb --help'
end
