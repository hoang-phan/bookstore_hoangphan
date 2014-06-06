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
        it { should_not have_link("Logout") }

      end

    end

    describe "valid login" do

      before { sign_in user }

      it { should have_link('Logout',    href: signout_path) }
      it { should_not have_link('Login', href: signin_path) }
      it { should have_link("Settings", href: edit_user_path(user)) }

      describe "followed by signout" do
        before { click_link "Logout" }
        it { should have_link('Login') }
      end

    end

  end

  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_title('Sign in') }
        end

        describe "submitting to the update action" do
          before { patch user_path(user) }
          specify { expect(response).to redirect_to(signin_path) }
        end
      end

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Login"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            expect(page).to have_title('Edit user')
          end
        end
      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user, no_capybara: true }

      describe "submitting a GET request to the Users#edit action" do
        before { get edit_user_path(wrong_user) }
        it { should_not have_title("Edit user") }
        specify { expect(response).to redirect_to(root_url) }
      end

      describe "submitting a PATCH request to the Users#update action" do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end
  end
end
