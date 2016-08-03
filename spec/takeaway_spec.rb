require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let (:menu) { double :menu, show_dishes: printed_menu }
  let (:printed_menu) { "Chicken, £2.50" }

  it 'shows the menu with dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
end
