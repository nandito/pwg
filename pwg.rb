#!/usr/bin/env ruby

class PasswordGenerator
  def genpass(length)
    abcl = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
    abcu = abcl.map { |x| x.upcase }
    nums = %w(0 1 2 3 4 5 6 7 8 9)
    specchars = %w(§ ' " + ! % / = ( ) , . - _ : ? < > { } [ ] # & @ *)
    arr = [abcl,abcu,nums,specchars]
    pass = []
    length.times do
      choosen_type = arr[rand(0..3)]
      chossen_char = choosen_type[rand(0..choosen_type.length-1)]
      pass << chossen_char
    end
    pass.join('')
  end
end

if ARGV[0].to_i > 0
  l = ARGV[0].to_i
  pass = PasswordGenerator.new
  STDOUT.puts "#{l} char password: #{pass.genpass(l)}"
else
  STDOUT.puts <<-EOF
  Please provide password length: ruby pwg.rb [number]

  Usage:
    ruby pwg.rb 10

  EOF
  puts "Given argument: #{ARGV[0]}"
end
