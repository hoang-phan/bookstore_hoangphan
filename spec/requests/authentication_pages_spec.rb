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
          user.password = "Wrongpass"
          sign_in user
        end

        it { should have_content("Sign in") }
      end

      describe "consecutive failed login" do
        let(:correct_password) { user.password }
        before do
          user.password = "Wrongpass"
          maxlogin = Integer(ENV['MAX_LOGIN_ATTEMPTS'])
          maxlogin.times { sign_in user }
        end

        # captcha shown
        it { should have_content("You have failed more than") }

        it "should be captcha verified" do
          # even if user name and password are correct
          user.password = correct_password
          sign_in user
          # if not enter captcha (a.k.a captcha verification failed)

          # not logged in
          page.should have_content("Sign in")
        end
      end
    end

    describe "valid sigin" do
      before { sign_in user }

      it { should have_title("Welcome") }

    end
  end
end
