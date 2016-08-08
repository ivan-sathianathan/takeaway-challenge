require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }
  let (:menu) { double :menu, show_dishes: printed_menu }
  let (:order) { instance_double "Order", total: 12.49 }
  let (:sms) { instance_double "SMS", deliver: nil }
  let (:printed_menu) { "Chicken, £2.50" }
  let (:dishes) { {chicken: 1, beef: 2} }

  before do
    allow(order).to receive(:add)
  end

  context '#print_menu' do
    it 'shows the menu with dishes and prices' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end
  end

  context '#place_order' do
    it 'can order some number of available dishes' do
      expect(order).to receive(:add).twice
      takeaway.place_order(dishes)
    end
    it 'knows the order total' do
      total = takeaway.place_order(dishes)
      expect(total).to eq 12.49
    end
    it 'sends an SMS when the order has been placed' do
      expect(sms).to receive(:deliver)
      takeaway.place_order(dishes)
    end
  end
end
