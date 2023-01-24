require 'rails_helper'

RSpec.describe 'Register', type: :system do

  it 'allows a user to register correctly' do
    expect do
      visit new_user_registration_path
      fill_in 'Email', with: 'anes.hodza04@gmail.com'
      fill_in 'First name', with: 'Anes'
      fill_in 'Last name', with: 'Hodza'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Sign up'
    end.to change(User, :count).by(1)
  end
end
