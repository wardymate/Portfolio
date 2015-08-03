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

  context 'creating creations' do
    scenario 'prompts user to fill out a form, then displays the new creation' do
      visit '/creations'
      click_link 'Add a creation'
      fill_in 'Name', with: 'Test creation'
      click_button 'Create Creation'
      expect(page).to have_content 'Test creation'
      expect(current_path).to eq '/creations'
    end
  end

  context 'viewing creations' do
    let!(:tc) {Creation.create(name: "Test creation")}
    
    scenario 'lets a user view a creation' do
      visit '/creations'
      click_link 'Test creation'
      expect(page).to have_content 'Test creation'
      expect(current_path).to eq "/creations/#{tc.id}"
    end
  end

  context 'editing creations' do
    before { Creation.create name: "Test creation"}
    
    scenario 'let a user edit a creation' do
      visit '/creations'
      click_link 'Test creation'
      click_link 'Edit'
      fill_in 'Name', with: 'Updated Test Creation'
      click_button 'Update Creation'
      expect(page).to have_content 'Updated Test Creation'
      expect(current_path).to eq '/creations'
    end
  end
end
