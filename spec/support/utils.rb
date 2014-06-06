def sign_up(user)
  fill_in "Full name", with: user.full_name
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  fill_in "Password confirmation", with: user.password
  fill_in "Birthday", with: user.birthday
  fill_in "Phone", with: user.phone
end

def sign_in(user, options={})
  visit new_user_session_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end