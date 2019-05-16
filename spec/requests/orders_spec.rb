require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let!(:user) { User.create email: "maciej@koza.com" }

  describe "POST /orders" do
    it "should create an order and order_items" do
      expect {
        post orders_index_path, email: "maciej@koza.com",
             order: {
               order_items_attributes: {
                 service_type_name: "PremiumPosting",
                 quantity: 3
               }
             }
      }.to change { user.orders }.by(1)

      order = user.orders.last

      expect(order.total).to eq(250)

      order_item = order.order_items.take

      expect(order_item.quantity).to eq(3)
      expect(order_item.service_type).to eq(PremiumPosting.take)

      expect(response).to have_http_status(200)
    end
  end
end
