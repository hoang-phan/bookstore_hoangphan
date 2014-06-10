require 'spec_helper'

describe CategoriesController do

  let(:category) { FactoryGirl.create(:category) }
  let(:book) { FactoryGirl.create(:book) }
  let(:book1) { FactoryGirl.create(:book, title: "keyword1") }
  let(:book2) { FactoryGirl.create(:book, author_name: "keyword2") }
  let(:book3) { FactoryGirl.create(:book, author_name: "keyword2") }

  before do
    book.book_category_items.create(category_id: category.id)
    book1.book_category_items.create(category_id: category.id)
    book2.book_category_items.create(category_id: category.id)
  end

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

    it "should have @books" do
      get :show, id: category.id
      assigns(:books).should eq([book, book1, book2])
    end
  end

  context "search" do
    it "should set @books" do
      get :search, id: category.id, search: "keyword"
      assigns[:books].should eq([book1, book2])
    end
  end

end
