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

  it 'tells if a dish is on the menu' do
    expect(menu.has_dish?(:chicken)).to be true
  end

  it 'tells if a dish is not on the menu' do
    expect(menu.has_dish?(:fish)).to be false
  end

end
