require 'spec_helper'

describe Book do

  let(:book) { FactoryGirl.create(:book) }
  subject { book }

  before do
    comment1 = FactoryGirl.create(:comment, user_id: 1, rating: 2)
    comment2 = FactoryGirl.create(:comment, user_id: 2, rating: 2)
    comment3 = FactoryGirl.create(:comment, user_id: 3, rating: 2)
    book.comments << [comment1, comment2, comment3]
  end

  context "total rating" do
    it "should have exact total rating" do
      expect(subject.total_rating_value).to eq(6)
      expect(subject.total_rating_count).to eq(3)
    end
  end

end
