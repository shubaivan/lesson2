require 'colorize'
require 'yaml'

class Ball
  def shake
    puts 'Answer'
    gets.chomp

    array_answer = YAML.load_file(File.join(__dir__, '/answers.yml'))
    randon_element_array = array_answer.sample
    key_random_element = array_answer.index(randon_element_array)
    color = get_color key_random_element
    # randon_element_array.to_s.colorize(color.to_sym)
    colorize(randon_element_array.to_s, color)
  end

  def get_color(key)
    color = '0;30'
    color = '0;34' if key >= 0 && key <= 4
    color = '0;32' if key >= 5 && key <= 9
    color = '0;33;49' if key >= 10 && key <= 14
    color = '0;31' if key >= 15 && key <= 19
    color
  end

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end
end
