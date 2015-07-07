require 'minitest/autorun'
require 'pry'

class CartTest < MiniTest::Test

  def test_items_have_a_name_and_a_price
    widget = Item.new("Premium Widget", 44)

    assert_equal widget.name, "Premium Widget"
    assert_equal widget.price, 44
  end

  def test_carts_can_have_items
    mortar = Item.new( "Mortar", 13)
    pestle = Item.new( "Pestle", 7)

    cart = Cart.new

    cart.add_item(mortar)
    assert_equal cart.item_count, 1
    cart.add_item(pestle)
    assert_equal cart.item_count, 2
    assert cart.contains?(mortar)
  end

  def test_carts_know_their_cost
    mortar = Item.new("Mortar", 13)
    pestle = Item.new("Pestle", 7)
    widget = Item.new("Cheap Widget", 40)

    cart = Cart.new
    cart.add_item(mortar)
    cart.add_item(pestle)
    cart.add_item(widget)

    assert_equal cart.cost_before_tax, 60
    assert_equal cart.cost_after_tax, 66
  end

  def test_carts_know_their_tax_rates
    cart = Cart.new
    assert_equal cart.tax_rate, 10

    special_cart = Cart.new({tax_rate: 20})
    assert_equal special_cart.tax_rate, 20
  end

  def test_special_carts_know_their_after_tax_rates
    special_cart = Cart.new({tax_rate: 20})

    bread = Item.new("bread", 20)
    special_cart.add_item(bread)
    assert_equal special_cart.cost_before_tax, 20
    assert_equal special_cart.cost_after_tax, 24
  end

end