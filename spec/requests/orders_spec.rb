require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let!(:user) { User.create email: "maciej@koza.com" }

  describe "orders" do
    it "should create an order and order_items" do
      expect {
        post orders_path, params: {
          email: "maciej@koza.com",
          order: {
            order_items_attributes: {
              service_type_name: "PremiumPosting",
              quantity: 3
            }
          }
        }
        expect(response).to have_http_status(:success)
      }.to change { user.orders }.by(1)

      order = user.orders.last

      expect(order.paid?).to be(false)
      expect(order.total).to eq(250)

      order_item = order.order_items.take

      expect(order_item.quantity).to eq(3)
      expect(order_item.service_type).to eq(PremiumPosting.take)

      charge = order.charge

      expect(charge.system_id).to_not be_nil

      expect {
        post artistripe_webhooks_path id: charge.system_id
      }.to change { order.reload.paid? }.to(true)
    end
  end
end
