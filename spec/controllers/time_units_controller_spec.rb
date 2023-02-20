require 'rails_helper'

RSpec.describe TimeUnitsController, type: :controller do
  let(:user) { create(:user) }
  let(:time_unit) { create(:time_unit, user: user, task: task) }
  let(:current_time_unit) { create(:time_unit, user: user, task: task, end_time: nil) }
  let(:task) { create(:task) }

  before do
    sign_in user
  end
  
  describe 'GET #index' do
    let!(:time_unit) { create(:time_unit, user: user, task: task) }
    let!(:current_time_unit) { create(:time_unit, user: user, task: task, end_time: nil) }
    it 'assigns @time_units' do
      get :index
      expect(assigns(:time_units)).to eq([time_unit])
    end

    it 'assigns @my_unended_time' do
      get :index
      expect(assigns(:my_unended_time)).to eq(current_time_unit)
    end

    context 'when there are no time units without end time' do
      before do
        current_time_unit.destroy
      end

      it 'created a new time unit' do
        expect do
          get :index
        end.to change(TimeUnit, :count).by(1)
      end
    end
  end

  describe 'POST #create' do
    it 'creates a new time unit' do
      expect do
        post :create, params: { time_unit: { id: current_time_unit.id, task_id: task.id, 
                                             description: 'New description' } }
      end.to change(TimeUnit, :count).by(1)
    end
  end

  describe 'DELETE #destroy' do
    let!(:time_unit) { create(:time_unit, user: user, task: task) }
    it 'deletes the time unit' do
      expect do
        delete :destroy, params: { id: time_unit.id }
      end.to change(TimeUnit, :count).by(-1)
    end
  end
end
