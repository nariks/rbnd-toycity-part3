class Product

  attr_reader :title, :price, :stock
  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def add_to_products
    @@products.each do |product|
      raise DuplicateProductError, "#{@title} already exists \n"  if product.title == @title
    end

    @@products << self
  end

  def self.find_by_title(title)
    @@products.each do |product|
        return product if product.title == title
    end
  end

  def in_stock?
    @stock > 0 ? true : false
  end





end
