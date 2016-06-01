require 'optparse'
require 'ostruct'

class Optparse

  #
  # Return a structure describing the options.
  #
  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new
    options.characterset = %w(l u n s)
    options.length = 10
    options.copyclipboard = false

    opt_parser = OptionParser.new do |opts|
      opts.banner = 'Usage: example.rb [options]'

      opts.separator ''
      opts.separator 'Specific options:'

      opts.on('-u', '--use CHARSET',
              'Allowed:', 'l : lowercase', 'u : uppercase', 'n : numbers', 's : special characters') do |chars|
        options.characterset = chars.split('')
      end

      opts.on('-l', '--length NUMBER',
              'Length (mininum: 1, default: 10)') do |l|
        options.length = l.to_i
      end

      opts.on('-c', '--copyclipboard', 'Copy generated password to clipboard') do |c|
        options.copyclipboard = c
      end

      opts.separator ''
      opts.separator 'Common options:'

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail('-h', '--help', 'Show this message') do
        puts opts
        exit
      end

      # Another typical switch to print the version.
      opts.on_tail('--version', 'Show version') do
        puts ::VERSION.join('.')
        exit
      end
    end

    opt_parser.parse!(args)
    options
  end # parse()

end # class Optparse
