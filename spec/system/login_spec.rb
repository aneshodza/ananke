# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login' do
  before do
    create(:user, email: 'test@data.com', password: '123456')
  end

  it 'allows a user to login' do
    visit new_user_session_path
    fill_in 'Email', with: 'test@data.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
  end

  it 'does not allow a user to login with wrong credentials' do
    visit new_user_session_path
    fill_in 'Email', with: 'testman@test.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content(I18n.t('devise.failure.invalid', authentication_keys: 'Email'))
  end

  context 'when a user gets redirected to login page' do
    let!(:user) { create(:user, email: 'definetly@notlogged.com', password: '123456') }

    before do
      visit users_path
    end

    it 'redirects to login page with a message' do
      expect(page).to have_content('You must be logged in to access this page')
    end

    it 'allows a user to login and redirects to where he was before' do
      fill_in 'Email', with: 'test@data.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content(user.email)
    end
  end
end
