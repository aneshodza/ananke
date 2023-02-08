# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Register', type: :system do
  context 'when user is not logged in' do
    it 'allows a user to register correctly' do
      expect do
        visit new_user_registration_path
        fill_in 'Email', with: 'test@data.com'
        fill_in 'First name', with: 'test'
        fill_in 'Last name', with: 'data'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
        click_button 'Sign up'
      end.to change(User, :count).by(1)
    end

    it 'redirects if registration is disabled' do
      ENV['REGISTERABLE'] = 'false'
      visit new_user_registration_path
      expect(page).to have_content('Registration is disabled')
      ENV['REGISTERABLE'] = 'true'
    end
  end

  context 'when user is logged in' do
    before do
      sign_in create(:user, email: 'test@user.com')
    end

    it 'shows new user created', js: true do
      ENV['REGISTERABLE'] = 'false'
      visit new_user_registration_path
      fill_in 'Email', with: 'test@data.com'
      fill_in 'First name', with: 'test'
      fill_in 'Last name', with: 'data'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Sign up'

      expect(page).to have_content('Successfully created a user!')
      expect(page).to have_content('test data')
      expect(User.count).to eq(2)
      ENV['REGISTERABLE'] = 'true'
    end
  end
end
