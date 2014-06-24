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
      comments_count = book.comments.count
      post :create, comment: { book_id: book.id, content: "Blah", rating: "4" }
      expect( book.comments.count - comments_count ).to eq(1)
    end

    it "should not create @comment if duplicate" do
      subject.stub(:current_user) { user }
      post :create, comment: { book_id: book.id, content: "Blah", rating: "4" }
      comments_count = book.comments.count
      post :create, comment: { book_id: book.id, content: "Blah", rating: "4" }
      expect( book.comments.count - comments_count ).to eq(0)
      response.should be_redirect
    end
  end
end
