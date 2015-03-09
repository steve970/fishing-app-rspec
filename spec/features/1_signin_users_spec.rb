require 'rails_helper'

feature 'my fishing app' do
  background do
    User.create(:first_name => 'Steve', :last_name => 'H', :email => 'student@gschool.com', :password => '1234')
  end

  scenario 'an existing user can sign in' do
    visit root_path

    expect(page).to have_content 'Welcome to My Fishing App'

    fill_in 'Email', with: 'student@gschool.com'
    fill_in 'Password', with: '1234'
    click_on 'Sign In'

    expect(current_path).to eq rivers_path
    expect(page).to have_content 'What river are you fishing?'
  end

  scenario 'an existing user has to fill in all of the fields' do
    visit root_path

    expect(page).to have_content 'Welcome to My Fishing App'

    click_on 'Sign In'

    expect(current_path).to eq root_path
    expect(page).to have_content 'TRY AGAIN'
  end
end
