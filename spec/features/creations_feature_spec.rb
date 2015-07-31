require 'rails_helper'

feature 'creations' do
  context 'no creations have been added' do
    scenario 'displays a prompt to add a creation' do
      visit '/creations'
      expect(page).to have_content 'No creations yet'
      expect(page).to have_link "Add a creation"
    end
  end
end
