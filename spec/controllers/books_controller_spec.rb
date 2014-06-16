require 'spec_helper'

describe BooksController do
  let (:book) { FactoryGirl.create(:book) }
  let (:book1) { FactoryGirl.create(:book, title: "xykeyword") }
  let (:book2) { FactoryGirl.create(:book, author_name: "keywordyz") }
  let (:user) { FactoryGirl.create(:user) }
  let (:order) { FactoryGirl.create(:order, user_id: user.id) }

  context "index" do
    it "should set @books" do
      get :index
      assigns[:books].should eq([book, book1, book2])
    end
  end

  context "show" do
    it "should set @book" do
      get :show, id: book.id
      assigns[:book].should eq(book)
    end
  end

  context "rating" do
    it "should post rating @books" do
      post :rating, rating: 5, book_id: book.id
    end
  end

  context "change_per_page" do
    it "should post change_per_page @books" do
      post :change_per_page, per_page: 8
    end
  end
end