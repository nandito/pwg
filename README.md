# pwg

Generate passwords in command line.

## Installation

Use gem install in command line:

    $ gem install pwg

## Usage

Generate 10 characters long password:

    $ pwd

The default length is 10 characters. To specify the length of the generated password use the `-l [number]` switch:

    $ pwd -l 12

To specify the character sets use the `-u [code]` switch:

    $ pwd -u lu

Available switches:

* `l` - lowercase characters
* `u` - uppercase characters
* `n` - numbers
* `s` - special characters
* The default is to use all of the characters mentioned above.

Get help:

    $ pwd --help

## To do

* Add option to copy the generated code to clipboard
* Add option to hide the generated code in the command line when it is copied to clipboard
* Show the strength of the generated password
* Generate password based on a given Regex

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nandito/pwg. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
