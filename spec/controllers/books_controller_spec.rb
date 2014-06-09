require 'spec_helper'

describe BooksController do
  let (:book) { FactoryGirl.create(:book) }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "SHOW 'index'" do
    it "returns http success" do
      get 'show', id: book.id
      response.should be_success
    end
  end

  describe "index" do
    before do
      get :index
    end

    it "should set @books" do
      assigns[:books].should eq([book])
    end
  end

end