require 'spec_helper'

describe SearchController do
  let (:book) { FactoryGirl.create(:book) }
  let (:book1) { FactoryGirl.create(:book, title: "xy keyword") }
  let (:book2) { FactoryGirl.create(:book, author_name: "keyword yz") }
  let (:book3) { FactoryGirl.create(:book, author_name: "keyword yz") }

  let (:category) { FactoryGirl.create(:category) }
  let (:category2) { FactoryGirl.create(:category) }

  before do
    book.book_category_items.create(category_id: category.id)
    book2.book_category_items.create(category_id: category.id)
    book1.book_category_items.create(category_id: category2.id)
    book3.book_category_items.create(category_id: category2.id)
  end

  context "index" do
    it "should set @books if search all" do
      get :index, search: "keyword", category_id: "-1"
      assigns[:books].should eq([book2, book1, book3])
    end

    it "should set @books if search 1 category" do
      get :index, search: "keyword", category_id: category.id
      assigns[:books].should eq([book2])
    end
  end
end
