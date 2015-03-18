def sign_in(user = create_user)
  visit root_path

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password

  within("form") do
    click_on 'Sign In'
  end
end
