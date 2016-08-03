require 'order'

class Takeaway
  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def print_menu
    menu.show_dishes
  end

  def place_order(dishes)
    total = 0
    dishes.each do | dish, quantity |
      order.add(dish, quantity)
    end
    order.total
  end

  private

  attr_reader :menu, :order
end
