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

  describe "edit user" do

    let(:user1) { FactoryGirl.create(:user) }

    before do
      sign_in user1
      visit edit_user_path(user1)
    end

    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit user") }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        user1.full_name = new_name
        user1.email = new_email
        sign_up user1
        click_button "Save changes"
      end

      it { should have_content(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Logout') }

      specify { expect(user1.reload.full_name).to  eq new_name }
      specify { expect(user1.reload.email).to eq new_email }
    end
  end

end
