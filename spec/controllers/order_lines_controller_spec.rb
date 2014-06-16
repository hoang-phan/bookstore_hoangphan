require 'spec_helper'

describe OrderLinesController do
  let(:book) { FactoryGirl.create(:book) }
  let(:user) { FactoryGirl.create(:user) }

  context "create" do
    it "should create @order_line" do
      subject.stub(:current_order) { FactoryGirl.create(:order, user_id: user.id) }
      post :create, order_line: { book_id: book.id }

    end
  end

end
