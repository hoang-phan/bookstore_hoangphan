require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { user.confirm! }

  describe "signin" do

    before { visit new_user_session_path }

    describe "invalid signin" do

      describe "blank" do
        before { click_button "Sign in" }
        #location not changed
        it { should have_content("Sign in") }
      end

      describe "invalid combination" do
        before do
          sign_in(user, "Wrongpass")
        end

        it { should have_content("Sign in") }
      end

      describe "consecutive failed login" do

        before do
          maxlogin = Integer(ENV['MAX_LOGIN_ATTEMPTS'])
          maxlogin.times { sign_in(user, "Wrongpass") }
        end

        # captcha shown
        it { should have_content("You have failed more than") }

        it "should verify captcha" do
          SessionsController.any_instance.stub(:verify_recaptcha) { false }
          sign_in user
          expect(page).to have_content("Sign in")
        end

      end
    end

    describe "valid sign in" do
      before { sign_in user }

      it { should have_title("Welcome") }

    end
  end
end
