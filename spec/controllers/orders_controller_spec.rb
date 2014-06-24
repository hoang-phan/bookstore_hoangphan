require 'spec_helper'
include ControllerMacros

describe OrdersController do
  login_user
  let (:book) { FactoryGirl.create(:book) }
  let (:book1) { FactoryGirl.create(:book) }
  let (:book2) { FactoryGirl.create(:book) }
  let (:user) { FactoryGirl.create(:user) }
  let (:user2) { FactoryGirl.create(:user) }
  let (:order) { FactoryGirl.create(:order, user_id: user.id) }
  let (:order2) { FactoryGirl.create(:order, user_id: user2.id) }

  before do
    order.order_lines.create(book_id: book1.id)
    order.order_lines.create(book_id: book2.id)
    order2.order_lines.create(book_id: book.id)
    subject.stub(:current_user) { user }
  end

  context "index" do
    it "should set @orders" do
      get :index
      assigns[:orders].should include(order)
      assigns[:orders].should_not include(order2)
    end
  end

  context "show" do
    it "should set @order" do
      get :show, id: order2.id
    end
  end

  context "edit" do
    it "should set @showcart" do
      get :edit, id: order.id
      assigns[:showcart].should eq true
    end
  end

  context "update" do
    it "should update @order" do
      Order.any_instance.stub(:purchase).and_return(true)
      patch :update, id: order.id, order: { shipping_address: "Some address" }
      response.should redirect_to(orders_success_path)
    end

    it "should not update @order" do
      Order.any_instance.stub(:purchase).and_return(false)
      patch :update, id: order.id, order: { shipping_address: "Some address" }
      response.should redirect_to(orders_failure_path)
    end

    it "should fail if any attribute is invalid" do
      patch :update, id: order.id, order: { order_date: "xxxyyyy" }
      response.should_not redirect_to(orders_failure_path)
    end
  end

  context "destroy" do
    it "should delete @order" do
      delete :destroy, id: order.id
      expect(response).to redirect_to books_path
    end
  end

  context "paypal" do
    it "should update @order" do
      Order.any_instance.stub(:purchase).and_return(true)
      patch :paypal, id: order.id, order: { shipping_address: "Some address" }
    end

    it "should not update @order" do
      Order.any_instance.stub(:purchase).and_return(false)
      patch :paypal, id: order.id, order: { shipping_address: "Some address" }
    end

    it "should fail if any attribute is invalid" do
      patch :paypal, id: order.id, order: { order_date: "xxxyyyy" }
      response.should_not redirect_to(orders_failure_path)
    end
  end

  context "success paypal" do
    it "should not be success" do
      get :success_paypal
      response.should redirect_to(orders_failure_path)
    end

    it "should redirect to success path if success" do
      ActiveMerchant::Billing::PaypalExpressResponse.any_instance.stub(:success?).and_return(true)
      get :success_paypal
      response.should redirect_to(orders_success_path)
    end
  end
end
