require 'spec_helper'

describe "StaticPages" do

  subject { page }

  before { visit root_path }

  it { should have_title("Welcome") }
  it { should have_content("We are the largest bookstore") }

  describe "non-signed-in user" do
    it { should have_link("Sign up") }
  end

  describe "signed-in user" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      user.confirm!
      sign_in user
      visit root_path
    end

    it { should_not have_link("Sign up") }
  end


end
