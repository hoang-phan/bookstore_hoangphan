require 'spec_helper'

describe BooksController do
  let (:book) { FactoryGirl.create(:book) }

  context "index" do
    it "should set @books" do
      get :index
      assigns[:books].should eq([book])
    end
  end

   context "show" do
    it "should set @book" do
      get :show, id: book.id
      assigns[:book].should eq(book)
    end
  end

end