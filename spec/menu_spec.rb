require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let (:dishes) do
    {
      chicken: 3.99,
      beef: 2.99,
      vegetarian: 1.99
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq dishes
  end

  it 'prints a list of dishes with prices' do
    printed_menu = "Chicken: £3.99, Beef: £2.99, Vegetarian: £1.99"
    expect(menu.show_dishes).to eq printed_menu
  end

end
