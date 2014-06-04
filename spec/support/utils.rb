def sign_up(user)
  fill_in "Full name", with: user.full_name
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  fill_in "Confirmation", with: user.password_confirmation
  fill_in "Birthday", with: user.birthday
  fill_in "Phone", with: user.phone
end