require 'spec_helper'

describe CommentsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:book) { FactoryGirl.create(:book) }

  before do
    user.confirm!
  end

  context "create" do
    it "should create a @comment" do
      subject.stub(:current_user) { user }
      post :create, comment: { book_id: book.id, content: "Blah", rating: "4" }
    end

    it "should not create @comment if duplicate" do
      subject.stub(:current_user) { user }
      post :create, comment: { book_id: book.id, content: "Blah", rating: "4" }
      post :create, comment: { book_id: book.id, content: "Blah", rating: "4" }
    end
  end
end
