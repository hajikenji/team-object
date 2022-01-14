class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class DVD < Product
  attr_reader :running_time
  def initialize(name, price, running_time)
    super
    @running_time = running_time
  end
end

dvd = DVD.new(100,200,300)
p dvd.name