class Hedgehog
  attr_accessor :name
  attr_accessor :life
  attr_accessor :mood
  attr_accessor :hunger
  attr_accessor :sleep

  def initialize name
    @name = name
    @life = 10
    @mood = 10
    @hunger =  10
    @sleep = 10
    puts @name + ' родился.'
  end

  def lets_eat
    puts 'Вы кормите ' + @name + '(а).'
    @hunger += 1
    time_iteratin_day
  end

  def rock
    puts 'Вы нежно укачиваете ' + @name + '(а).'
    @asleep = true
    puts 'Он быстро задрёмывает...'
    time_iteratin_day
    if @asleep
      @asleep = false
      puts '...но просыпается, как только вы перестали качать.'
    end
  end

  def lets_work
    puts @name + ' ушел работать'
    time_iteratin_day
  end

  def lets_check_hungry
    puts @hunger
  end

  def lets_help
    puts "\nAvailible commands : \n"+ self.class.instance_methods.grep(/lets_*/).sort.join("\n").to_s.gsub!('lets_', '')
  end

  def console_get
    console
  end

  protected

  def console
    loop do
      command = gets.chomp
      class_def = self.class.instance_methods(false)
      acess = false
      class_def.each {|x| (acess = true, self.public_send(x)) if 'lets_'+command == x.to_s}
      puts "this command '#{command}' was not found." unless acess

      break if command == 'exit'
    end
  end

  private

  def hungry?
    @hunger <= 5
  end

  def if_sleep?
    @hunger <= 5 && @sleep
  end

  def if_mood_off?
    @mood <= 5
  end

  def time_iteratin_day
    @hunger -= 1
    @sleep -= 1
    @mood -= 1
    if hungry?
      puts 'В желудке у ' + @name + '(а) урчит...'
    end

    if if_sleep?
      puts 'Он внезапно заснул голодным!'
    end
  end
end