require 'spec_helper'

describe OrderLinesController do
  let(:book) { FactoryGirl.create(:book) }
  let(:user) { FactoryGirl.create(:user) }

  context "index" do
    it "should list all line item" do
      subject.stub(:current_order) { FactoryGirl.create(:order, user_id: user.id) }
      get :index
    end
  end

  context "create" do
    it "should create @order_line" do
      subject.stub(:current_order) { FactoryGirl.create(:order, user_id: user.id) }
      xhr :post, :create, order_line: { book_id: book.id }
    end
  end

end
