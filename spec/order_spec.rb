require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:dishes) do
    {
      chicken: 2,
      beef: 1
    }
  end
  let(:menu) { instance_double("Menu") }

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:beef).and_return(true)
  end

  it 'selects several dishes from the menu' do
    order.add(:chicken, 2)
    order.add(:beef, 1)
    expect(order.dishes).to eq dishes
  end

  it 'does not allow items to be added to order that are not on the menu' do
    allow(menu).to receive(:has_dish?).with(:fish).and_return(false)
    expect { order.add(:fish, 2) }.to raise_error NoItemError, "Fish is not on the menu"
  end
end
