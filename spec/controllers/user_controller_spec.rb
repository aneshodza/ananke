# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserController do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }

  describe 'GET #index' do
    it 'lists all users' do
      get :index

      expect(response).to be_successful
      expect(assigns(:users)).to include(user)
      expect(assigns(:users)).to include(another_user)
    end
  end


  describe 'GET #my_tasks' do
    let!(:task) { create(:task, creator: user) }
    let!(:another_task) { create(:task, creator: another_user, assigned_user: user) }
    let!(:yet_another_task) { create(:task, creator: another_user) }

    before do
      sign_in user
    end

    it 'shows the tasks created by & assigned to the user' do
      get :my_tasks

      expect(response).to be_successful
      expect(assigns(:created_tasks)).to include(task)
      expect(assigns(:assigned_tasks)).to include(another_task)
      expect(assigns(:created_tasks)).not_to include(another_task)
    end
  end
end
