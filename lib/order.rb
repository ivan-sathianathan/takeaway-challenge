class Order

  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    fail NoItemError, "#{dish.capitalize} is not on the menu" unless menu.has_dish?(dish)
    dishes[dish] = quantity
    print_dishes_added(dish, quantity)
  end

  def total
    order_value = item_totals.inject(:+)
    print_order_value(order_value)
  end

  private

  attr_reader :menu

  def print_dishes_added(dish, quantity)
    "You have added #{quantity} #{dish} dishes to your order"
  end

  def item_totals
    dishes.map do | dish, quantity |
      menu.price(dish) * quantity
    end
  end

  def print_order_value(order_value)
    "Your order total is " + "£%.2f" % order_value
  end
end

class NoItemError < StandardError; end
