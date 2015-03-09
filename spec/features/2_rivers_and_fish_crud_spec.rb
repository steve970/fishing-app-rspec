require 'rails_helper'

feature 'my fishing app' do
  let(:user) do
    User.create(first_name: 'Jennifer', last_name: 'H', email: 'jennifer@gschool.com', password:'password')
  end

  scenario 'can add a new river to the directory' do
    visit root_path

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on 'Sign In'

    expect(current_path).to eq rivers_path

    click_link 'Add a New River'

    expect(page).to have_content 'This is where you can put in a new river to go fishing at!'

    fill_in :river_name, with: 'Poudre River'
    fill_in :river_city, with: 'Fort Collins'
    fill_in :river_state, with: 'CO'
    click_button 'Add a River'

    expect(current_path).to eq rivers_path
    expect(page).to have_content 'It is time to go fishing!!!!!'
    expect(page).to have_content 'Poudre River, Fort Collins, CO'
  end

  scenario 'can update an existing river from the show page' do
    river = create_river

    visit root_path

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on 'Sign In'

    expect(current_path).to eq rivers_path
    click_link 'Blue River'

    expect(current_path).to eq river_path(river)
    expect(page).to have_content 'Blue River'
    click_on 'Edit River Info'

    fill_in :river_name, with: 'Cripple Creek'
    fill_in :river_city, with: 'Frisco'
    fill_in :river_state, with: 'CO'
    click_button 'Update a River'

    expect(current_path).to eq rivers_path
    expect(page).to have_content 'Thanks for fixing that, it is time to go fishing!!!!!'
    expect(page).to have_content 'Cripple Creek, Frisco, CO'
  end

  scenario 'can delete an existing river from the show page' do
    river = create_river

    visit root_path

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on 'Sign In'

    expect(current_path).to eq rivers_path
    click_link 'Blue River'

    expect(current_path).to eq river_path(river)
    expect(page).to have_content 'Blue River'
    click_on 'Delete River'

    expect(current_path).to eq rivers_path
    expect(page).to_not have_content 'Blue River'
    expect(page).to have_content 'YOU RUINED IT!'
  end

  scenario 'user cannot see the rivers list without signing in' do
    visit rivers_path

    expect(current_path).to eq root_path
    expect(page).to have_content 'You need to sign in first before you can see the fishing hot spots!'
  end

end
