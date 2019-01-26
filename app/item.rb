class Item
  attr_accessor :name, :price

  @@all = []
  @@items = []

  def initialize(name,price)
    @name = name
    @price = price

    @@all << self
  end

  def self.all
    @@all
  end
end
