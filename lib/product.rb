class Product

  attr_reader :title, :price, :stock
  attr_writer :stock
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

  #add new product after checking it doesn't exist.
  def add_to_products
    err_msg = "#{@title} already exists \n"
    @@products.each {|product| raise DuplicateProductError, err_msg if product.title == @title }
    @@products << self
  end

  #To check if a product title exists
  def self.find_by_title(title)
    @@products.each {|product| return product if product.title == title}
    raise NoSuchProductError, "#{title} is not available"                                                       #error raised if no match found
  end

  #To check if a product has stock available
  def in_stock?
    @stock > 0 ? true : false
  end

  #to returns an array of all products in stock
  def self.in_stock
    prod_in_stock = []
    @@products.each { |product| prod_in_stock << product if product.in_stock? }
    return prod_in_stock
  end

end
