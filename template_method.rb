class Drink
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def make
    get_cup
    get_water
    prepare
  end

  def get_cup
    puts "Getting cup for a #{name}"
  end

  def get_water
    puts "Boiling water for #{name}"
  end

  def prepare
    raise 'Abstract method called'
  end
end

class Tea < Drink
  def prepare
    puts 'Put tea bag into water'
    puts 'Wait 5 minutes'
  end
end

class Coffee < Drink
  attr_accessor :type

  def initialize(name, type)
    super(name)
    @type = type
  end

  def prepare
    puts 'Put coffee into cup'
    puts 'Pour hot water'
    puts 'Wait'
  end
end

puts 'PREPARING TEA'
tea = Tea.new('Darjeeling tea')
tea.make

puts '----------'
puts 'PREPARING COFFEE'

coffee = Coffee.new('Lavazza', 'natural arabica')
coffee.make
