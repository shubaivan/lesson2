require 'colorize'
require 'yaml'

class Ball
  ANSWERS = YAML.load_file(File.join(__dir__, '/answers.yml'))

  def shake
    ANSWERS.sample
  end

  def key(randon_element_array)
    ANSWERS.index(randon_element_array)
  end

  def color_shake
    puts 'Answer'
    gets.chomp
    randon_element_array = shake
    key_random_element = key randon_element_array
    color = get_color key_random_element
    response = colorize(randon_element_array.to_s, color)
    response
  end

  def get_color(key)
    case key
      when 0...4
        color = '0;34'
      when 5...9
        color = '0;32'
      when 10...14
        color = '0;33;49'
      when 15...19
        color = '0;31'
      else
        color = '0;30'
    end
    color
  end

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end
end
