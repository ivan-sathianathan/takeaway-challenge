require 'sms'

describe SMS do
  subject(:sms) { described_class.new(config, client: client) }
  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }

  let(:config) do
    {
      account_sid: "123",
      auth_token: "abc456",
      from: "+123",
      to: "+456",
      body: "Thank you! Your order will be delivered before %s"
    }
  end

  context '#deliver' do
    it 'delivers SMS with the estimated time' do
      args = {
        from: config[:from],
        to: config[:to],
        body: "Thank you! Your order will be delivered before 18:43"
      }
      allow(Time).to receive(:now).and_return(Time.parse("17:43"))
      expect(messages).to receive(:create).with(args)
      sms.deliver
    end
  end
end
