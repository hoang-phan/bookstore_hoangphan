require 'spec_helper'

describe Order do

  let(:user) { FactoryGirl.create(:user) }
  let(:book) { FactoryGirl.create(:book) }
  let(:order) { FactoryGirl.create(:order, user_id: user.id ) }

  before { order.order_lines.create(book_id: book.id) }

  context "purchase" do
    it "should not be success" do
      order.purchase.should eq(false)
    end
  end

  context "build purchase" do
    it "should return items" do
      items = order.build_purchase
      items.count.should eq(1)
      items[0][:name].should eq(book.title)
    end
  end
end
