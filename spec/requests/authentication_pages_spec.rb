require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }
  let(:user) { FactoryGirl.create(:user) }

  describe "sign in page" do

    before { visit signin_path }

    it { should have_content("Email") }
    it { should have_content("Password") }
    it { should have_link("Login") }

    describe "invalid login" do
      before { click_button "Login" }

      it { should have_selector('div.alert.alert-error') }

      describe "3 fails login" do
        before do
          3.times do
            visit signin_path
            fill_in "Email", with: user.email.upcase
            click_button "Login"
          end
        end

        it { should have_content("You have failed more than 3 login attempts")}
      end

    end

    describe "valid login" do

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
