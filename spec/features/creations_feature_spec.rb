require 'rails_helper'

feature 'creations' do
  context 'no creations have been added' do
    scenario 'displays a prompt to add a creation' do
      visit '/creations'
      expect(page).to have_content 'No creations yet'
      expect(page).to have_link "Add a creation"
    end
  end

  context 'creations have been added' do
    before do
      Creation.create(name: 'Test creation')
    end
    scenario 'displays creations' do
      visit '/creations'
      expect(page).to have_content('Test creation')
      expect(page).not_to have_content('No creations yet')
    end
  end
end
