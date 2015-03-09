require 'rails_helper'

feature 'my fishing app' do

  scenario 'a user signs up' do
    visit root_path

    expect(page).to have_content 'Welcome to My Fishing App'
    expect(page).to have_content 'New?'

    click_link 'New? Sign Up Here!'

    fill_in :user_first_name, with: 'Steve'
    fill_in :user_last_name, with: 'H'
    fill_in :user_email, with: 'student@gschool.com'
    fill_in :user_password, with: '1234'
    fill_in :user_password_confirmation, with: '1234'
    click_on 'Sign Up'

    expect(current_path).to eq rivers_path
    expect(page).to have_content 'What river are you fishing?'
  end

  scenario 'a user has to fill in all of the fields' do
    visit root_path

    expect(page).to have_content 'Welcome to My Fishing App'
    expect(page).to have_content 'New?'

    click_link 'New? Sign Up Here!'

    click_on 'Sign Up'

    expect(current_path).to eq signup_path
    expect(page).to have_content 'can\'t be blank'
  end

end
