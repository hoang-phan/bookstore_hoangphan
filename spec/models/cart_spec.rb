require 'spec_helper'

describe Cart do

  let(:book) { FactoryGirl.create(:book) }
  let(:book2) { FactoryGirl.create(:book) }
  before { subject = FactoryGirl.create(:cart) }
  describe "add a book" do
    it "should create a cart with book" do
      expect(subject.add_book(book.id).book).to eq book
    end
  end

  describe "get statistical values" do

    before do
      subject.add_book(book.id)
      subject.add_book(book.id)
      subject.add_book(book2.id)
    end

    it "should get exact total price" do
      expect(subject.total_price).to eq (2 * book['unit_price'] + book2['unit_price'])
    end

    it "should get exact total quantity" do
      expect(subject.total_quantity).to eq 3
    end

  end
end
