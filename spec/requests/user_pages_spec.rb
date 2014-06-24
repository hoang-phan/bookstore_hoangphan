require 'spec_helper'

describe "UserPages" do

  let(:non_signed_up_user) { User.new(full_name:"Hoang Phan", email: "hasdw@sad.asd", password: "12345678", birthday: "22/1/1992", phone:"0123012321312") }
  let(:user) { FactoryGirl.create(:user) }

  subject { page }

  describe "signup" do

    describe "non-signed-in user" do
      before { visit new_user_registration_path }

      it { should have_title("Sign up") }

      describe "valid sign up" do
        before { sign_up non_signed_up_user }

        it "should send a mail" do
          click_button "Register"
          user.send(:send_confirmation_notification?).should eq true
        end

      end
      describe "invalid sign up" do

        describe "blank" do
          before { click_button "Register" }
          it { should have_content("error") }
        end

        describe "invalid email" do
          before do
            non_signed_up_user.email = "aaaaa"
            sign_up non_signed_up_user
            click_button "Register"
          end
          it { should have_content("error") }
        end

        describe "invalid password" do
          before do
            non_signed_up_user.password = "aaaaa"
            sign_up non_signed_up_user
            click_button "Register"
          end
          it { should have_content("error") }
        end

        describe "mismatch password" do
          before do
            sign_up non_signed_up_user
            fill_in "Password confirmation", with: "Wrongpass"
            click_button "Register"
          end
          it { should have_content("error") }
        end

        describe "duplicate email" do
          before do
            sign_up user
            click_button "Register"
          end
          it { should have_content("error") }
        end

      end

    end

    describe "signed_in user" do

      before do
        user.confirm!
        sign_in user
        visit new_user_registration_path
      end

      it { should_not have_title("Sign up") }
    end

  end

  describe "edit" do
    before do
      user.confirm!
      sign_in user
      visit edit_user_registration_path
    end

    describe "with invalid information" do
      describe "not have current password" do
        before do
          click_button "Update"
        end

        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Current password", with: user.password
        click_button "Update"
      end

      it { should_not have_content('error') }
    end
  end

end
