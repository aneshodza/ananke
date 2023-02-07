# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'unique email' do
    let(:user) { build(:user) }
    let(:user2) { build(:user) }

    it 'should be unique' do
      user2.email = user.email
      user.save
      expect(user2).to be_invalid
    end
  end
end
