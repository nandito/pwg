require 'spec_helper'

describe Pwg do
  it 'has a version number' do
    expect(::VERSION).not_to be nil
  end

  describe 'PasswordGenerator' do
    it 'sets the proper charsets' do
      l = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
      u = l.map(&:upcase)
      n = %w(0 1 2 3 4 5 6 7 8 9)
      s = %w(§ ' " + ! % / = ( ) , . - _ : ? < > { } [ ] # & @ *)

      e = Pwg::PasswordGenerator.new

      charset_array_l = e.setcharset(['l'])
      charset_array_lu = e.setcharset(['l','u'])
      charset_array_ns = e.setcharset(['n','s'])
      charset_array_luns = e.setcharset(['l','u','n','s'])

      expect(charset_array_l).to eq([l])
      expect(charset_array_lu).to eq([l, u])
      expect(charset_array_ns).to eq([n, s])
      expect(charset_array_luns).to eq([l, u, n, s])
    end

    it 'generates the proper length password' do
      e = Pwg::PasswordGenerator.new

      pass_0 = e.genpass(0, ['l'])
      pass_1 = e.genpass(1, ['l'])
      pass_10 = e.genpass(10, ['u'])
      pass_100 = e.genpass(100, ['n'])

      expect(pass_0.length).to eq 0
      expect(pass_1.length).to eq 1
      expect(pass_10.length).to eq 10
      expect(pass_100.length).to eq 100
    end

  end
end
