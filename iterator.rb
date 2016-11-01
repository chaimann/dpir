class Customer
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def <=>(client)
    name <=> client.name
  end
end

class CustomerRegistry
  include Enumerable
  attr_accessor :company

  def initialize(company, *customers)
    @company = company
    @customers = customers
  end

  def add_customer(customer)
    @customers << customer
  end

  def each(&block)
    @customers.each(&block)
  end
end
