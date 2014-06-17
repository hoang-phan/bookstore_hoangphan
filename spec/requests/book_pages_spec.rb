require 'spec_helper'

describe "BookPages" do
  subject { page }

  before { visit books_path }

  describe "books page" do
    it { should have_title("All books") }

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:book) } }
      after(:all)  { Book.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each book" do
        Book.paginate(page: 1, per_page: 5).each do |book|
          expect(page).to have_content(book.title)
        end
      end
    end
  end

  describe "book show page" do
    let(:book) { FactoryGirl.create(:book) }
    before { visit book_path(book) }

    it { should have_content(book.title) }
  end

end
