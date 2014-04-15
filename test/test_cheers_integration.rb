require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_a_name_with_no_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "BRT"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
BRT's just GRAND!
Give me a.. B
Give me a.. R
Give me a.. T
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_volwels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "BART"
      pipe.close_write
      shell_output = pipe.read
  end
    expected_output = <<EOS
BART's just GRAND!
Give me a.. B
Give me an.. A
Give me a.. R
Give me a.. T
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_lowercase_letters_output
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "sami"
      pipe.close_write
      shell_output = pipe.read
  end
    expected_output = <<EOS
SAMI's just GRAND!
Give me a.. S
Give me an.. A
Give me a.. M
Give me an.. I
EOS
    assert_equal expected_output, shell_output
  end

  def test_combination_of_upper_and_lowercase_letters
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "BaRt"
      pipe.close_write
      shell_output = pipe.read
  end
    expected_output = <<EOS
BART's just GRAND!
Give me a.. B
Give me an.. A
Give me a.. R
Give me a.. T
EOS
    assert_equal expected_output, shell_output
  end

  def test_empty_string_input
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts ""
      pipe.close_write
      shell_output = pipe.read
  end
    expected_output = <<EOS
Nothing passed!
EOS
    assert_equal expected_output, shell_output
  end

  def test_if_numbers_are_the_input
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "123"
      pipe.close_write
      shell_output = pipe.read
  end
    expected_output = <<EOS
Nothing passed!
EOS
    assert_equal expected_output, shell_output
  end

  def test_if_numbers_and_letters_are_the_input
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "123a"
      pipe.close_write
      shell_output = pipe.read
  end
    expected_output = <<EOS
123A's just GRAND!
Give me a.. 1
Give me a.. 2
Give me a.. 3
Give me an.. A
EOS
    assert_equal expected_output, shell_output
  end

end
