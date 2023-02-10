require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  describe 'GET #show' do
    let(:task) { create(:task, description: "# Lorem") }

    it 'assigns the requested task to @task' do
      get :show, params: { id: task }
      expect(assigns(:task)).to eq task
    end

    it 'renders the :show template' do
      get :show, params: { id: task }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    let(:project) { create(:project) }

    it 'renders the :new template' do
      get :new, params: { project_id: project }
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    let(:task) { create(:task) }

    it 'assigns the requested task to @task' do
      get :edit, params: { id: task }
      expect(assigns(:task)).to eq task
    end

    it 'renders the :edit template' do
      get :edit, params: { id: task }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    let!(:task_attrs) { create(:task).attributes.except('id', 'created_at', 'updated_at') }

    context 'with valid attributes' do
      it 'saves the task in the database' do
        expect {
          post :create, params: { task: task_attrs }
        }.to change(Task, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the task in the database' do
        expect {
          task_attrs['name'] = nil
          post :create, params: { task: task_attrs }
        }.not_to change(Task, :count)
      end
    end
  end

  describe 'PATCH #update' do
    let!(:task) { create(:task) }

    context 'with valid attributes' do
      it 'updates the task in the database' do
        patch :update, params: { id: task, task: { name: 'New name' } }
        task.reload
        expect(task.name).to eq 'New name'
      end
    end

    context 'with invalid attributes' do
      it 'does not update the task in the database' do
        patch :update, params: { id: task, task: { name: nil } }
        task.reload
        expect(task.name).not_to eq nil
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:task) { create(:task) }

    it 'doesnt delete but rather finish the task' do
      expect {
        delete :destroy, params: { id: task }
      }.to change(Task, :count).by(0)
      task.reload
      expect(task.finished).to eq true
    end
  end
end
