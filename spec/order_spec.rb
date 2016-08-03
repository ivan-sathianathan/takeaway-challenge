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
    allow(menu).to receive(:price).with(:chicken).and_return(3.00)
    allow(menu).to receive(:price).with(:beef).and_return(2.50)
  end

  it 'selects several dishes from the menu' do
    create_order
    expect(order.dishes).to eq dishes
  end

  it 'does not allow items to be added to order that are not on the menu' do
    allow(menu).to receive(:has_dish?).with(:fish).and_return(false)
    expect { order.add(:fish, 2) }.to raise_error NoItemError, "Fish is not on the menu"
  end

  it 'calculates the total for the order' do
    create_order
    total = 8.50
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:chicken, 2)
    order.add(:beef, 1)
  end

end
