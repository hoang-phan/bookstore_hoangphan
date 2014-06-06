require 'spec_helper'

describe "UserPages" do

  let(:user) { User.new(full_name: "Example User", email: "ea@ea.exa", password:"123456",
                        password_confirmation:"123456", birthday:"22/01/1992") }

  before { visit signup_path }

  subject { page }

  describe "sign up" do
    describe "with invalid information" do

      describe "blank registration" do
        it "should not create a new user" do
          expect { click_button "Sign up" }.not_to change(User, :count)
        end
      end

      describe "invalid email" do

        it "should not create a new user with blank email" do
          user.email = " "
          sign_up user

          expect { click_button "Sign up" }.not_to change(User, :count)
        end

        it "should not create a new user with invalid email" do

          addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]

          addresses.each do |invalid_address|
            user.email = invalid_address
            sign_up user

            expect { click_button "Sign up" }.not_to change(User, :count)
          end

        end

      end

    end

    describe "with valid information" do

      before { sign_up user }

      it "should create a new user" do
        expect { click_button "Sign up" }.to change(User, :count).by(1)
      end

      it "should send a mail" do
        expect { click_button "Sign up" }.to change(Delayed::Job, :count).by(1)
      end

      describe "waiting for activation" do

        before { click_button "Sign up" }

        it { should have_content("Thank you") }
        it { should have_content(user.email) }

      end

    end

  end

  describe "show user" do
    let(:a_user) { FactoryGirl.create(:user) }

    before { visit user_path(a_user) }

    it { should have_content(a_user.full_name) }
    it { should have_content(a_user.email) }

  end

end
