require 'spec_helper'

describe LineItem do

  let(:book) { FactoryGirl.create(:book) }

  before { subject.stub(:book) { book } }

  describe "init" do
    it "should have total_price equal book's unit price" do
      expect(subject.total_price).to eq book['unit_price']
    end
  end

  describe "3 books" do
    it "should have total_price equal 3 books' unit price" do
      subject.stub(:quantity) { 3 }
      expect(subject.total_price).to eq (3 * book['unit_price'])
    end
  end

end
