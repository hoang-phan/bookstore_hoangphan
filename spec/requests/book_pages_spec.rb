require 'spec_helper'

describe "BookPages" do
  subject { page }
  describe "books page" do
    before { visit books_path }

    it { should have_title("All books") }
  end
end
