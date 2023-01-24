require 'rails_helper'

RSpec.describe 'Login', type: :system do
  before do
    create(:user, email: 'anes.hodza04@gmail.com', password: '123456')
  end

  it 'allows a user to login' do
    visit new_user_session_path
    fill_in 'Email', with: 'anes.hodza04@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
  end
end
