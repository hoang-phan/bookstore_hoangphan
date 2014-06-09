require 'spec_helper'

describe CategoriesController do

  let(:category) { FactoryGirl.create(:category) }

  context "index" do
    it "should have @categories" do
      get :index
      assigns(:categories).should eq([category])
    end
  end

  context "show" do
    it "should have @category" do
      get :show, id: category.id
      assigns(:category).should eq(category)
    end
  end
end
