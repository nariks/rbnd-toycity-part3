class Transaction

  attr_reader :customer, :product, :id
  @@id = 0
  @@transactions =[]


  def initialize(customer, product)
    @customer = customer
    @product = product
    @@id += 1
    @id = @@id
    product.stock -= 1
    @@transactions << self
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.each do |transaction|
      return transaction if transaction.id == id
    end
  end

end
