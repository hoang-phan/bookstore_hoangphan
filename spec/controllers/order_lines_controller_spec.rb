require 'spec_helper'

describe OrderLinesController do
  let(:book) { FactoryGirl.create(:book) }
  let(:order) { FactoryGirl.create(:order, user_id: user.id) }
  let(:user) { FactoryGirl.create(:user) }

  let(:order_line) { book.order_lines.create(order_id: order.id) }

  before do
    subject.stub(:current_order) { order }
  end

  context "index" do
    it "should be success" do
      get :index
      response.should be_success
    end
  end

  context "create" do
    it "should create @order_line" do
      order_lines_count = order.order_lines.count
      xhr :post, :create, order_line: { book_id: book.id }
      expect( order.order_lines.count - order_lines_count ).to eq(1)
    end
  end

  context "update" do
    it "should update @order_line" do
      patch :update, id: order_line.id, order_line: { quantity: 4 }
      expect(OrderLine.find(order_line.id).quantity).to eq(4)
    end
  end

  context "delete" do
    it "should delete @order_line" do
      xhr :delete, :destroy, id: order_line.id
      response.should be_success
    end
  end

end
