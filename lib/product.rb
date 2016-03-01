class Product

  attr_reader :title, :price, :stock
  @@products = []

  def initialize(options={})

    @@products.push(self)

  end

  def self.all

    @@products

  end





end
