require 'colorize'
require 'yaml'
class Ball
  def shake
    array_answer = YAML.load_file(File.join(__dir__, '/answers.yml'))
    randon_element_array = array_answer.sample
    key_random_element = array_answer.index(randon_element_array)
    color = '0;30'
    color = '0;34' if key_random_element >= 0 && key_random_element <= 4
    color = '0;32' if key_random_element >= 5 && key_random_element <= 9
    color = '0;33;49' if key_random_element >= 10 && key_random_element <= 14
    color = '0;31' if key_random_element >= 15 && key_random_element <= 19

    # randon_element_array.to_s.colorize(color.to_sym)

    colorize(randon_element_array.to_s, color)
  end

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end
end
