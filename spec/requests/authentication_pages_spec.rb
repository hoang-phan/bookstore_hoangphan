require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }

  describe "sign in page" do

    before { visit signin_path }

    it { should have_content("Email") }
    it { should have_content("Password") }
    it { should have_link("Login") }

    describe "invalid login" do
      before { click_button "Login" }

      it { should have_selector('div.alert.alert-error') }

    end

    describe "valid login" do
      let(:user) { FactoryGirl.create(:user) }

      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Login"
      end

      it { should have_link('Logout',    href: signout_path) }
      it { should_not have_link('Login', href: signin_path) }

      describe "followed by signout" do
        before { click_link "Logout" }
        it { should have_link('Login') }
      end

    end

  end
end
