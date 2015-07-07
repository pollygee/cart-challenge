class Cart
  attr_reader :tax_rate
  def initialize options = {}
    @cart = []
    @tax_rate= options[:tax_rate] || 10
  end

  def add_item thing
    @cart << thing
  end

  def item_count
    @cart.count
  end

  def contains? thing
    @cart.include? thing
  end

  def cost_before_tax
    total = 0
    @cart.each do |item|
      total += item.price
    end
  end

  def cost_after_tax
    cost_before_tax * @tax_rate
  end
end

