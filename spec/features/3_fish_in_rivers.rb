require 'rails_helper'

feature 'my fishing app' do

  before do
    User.destroy_all
  end

  scenario 'can add new fish to an existing river' do

    river = create_river

    visit root_path

    sign_in

    expect(current_path).to eq rivers_path
    click_link 'Blue River'

    expect(current_path).to eq river_path(river)

    click_on 'Add a fish to the river'

    expect(current_path).to eq new_river_fish_path(river)

    fill_in :fish_species, with: 'Brown Trout'
    fill_in :fish_length, with: '24 inches'
    click_on 'Add Fish'

    expect(current_path).to eq river_path(river)
    expect(page).to have_content 'That\'s a nice fish!'
    expect(page).to have_content 'Fish caught: Brown Trout, 24 inches'
  end

  scenario 'can update existing fish in rivers' do

    river = create_river
    fish = create_fish(river)

    visit root_path
    sign_in

    visit river_path(river)

    click_on 'Fish caught: Carp, 27 inches'

    expect(current_path).to eq river_fish_path(river, fish)
    expect(find_link('Back')[:href]).to eq(river_path(river))
    expect(find_link('Edit')[:href]).to eq(edit_river_fish_path(river, fish))
    expect(find_link('Delete')[:href]).to eq(river_fish_path(river, fish))
    click_on 'Edit'

    expect(current_path).to eq edit_river_fish_path(river, fish)
    fill_in :fish_species, with: 'Rainbow Trout'
    fill_in :fish_length, with: '20 inches'
    click_on 'Update Fish'

    expect(current_path).to eq river_path(river)
    expect(page).to have_content 'It\'s a good thing you updated that fish!'
    expect(page).to have_content 'Fish caught: Rainbow Trout, 20 inches'
  end

  scenario 'can delete a fish from the river' do

    river = create_river
    fish = create_fish(river)

    visit root_path
    sign_in

    visit river_fish_path(river, fish)

    click_on 'Delete'

    expect(current_path).to eq river_path(river)
    expect(page).to have_content 'You should always practice catch and release!'
    expect(page).to_not have_content 'Fish caught: Carp, 27 inches'
  end

end
