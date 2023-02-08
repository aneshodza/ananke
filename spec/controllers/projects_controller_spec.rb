require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  describe 'GET #index' do
    let!(:project) { create(:project) }
    it 'returns all projects' do
      get :index
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe 'GET #show' do
    let!(:project) { create(:project) }
    let!(:task) { create(:task, project: project) }
    let!(:task2) { create(:task, project: project) }
    it 'returns a project' do
      get :show, params: { id: project.id }
    end

    it 'lists all tasks' do
      get :show, params: { id: project.id }
      expect(assigns(:tasks)).to eq([task, task2])
    end

    it 'doesnt show tasks from other projects' do
      get :show, params: { id: project.id }
      expect(assigns(:tasks)).not_to include(create(:task))
    end

    it 'doesnt show finished tasks' do
      get :show, params: { id: project.id }
      expect(assigns(:tasks)).not_to include(create(:task, project: project, finished: true))
    end
  end

  describe 'GET #new' do
    it 'returns a new project' do
      get :new
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe 'GET #edit' do
    let!(:project) { create(:project) }
    it 'returns a project' do
      get :edit, params: { id: project.id }
      expect(assigns(:project)).to eq(project)
    end
  end

  describe 'POST #create' do
    it 'creates a new project' do
      expect {
        post :create, params: { project: project_params }
      }.to change(Project, :count).by(1)
    end

    it 'aborts with invalid params' do
      expect {
        post :create, params: { project: project_params.merge(name: nil) }
      }.not_to change(Project, :count)
    end

    it 'redirects to the project page' do
      post :create, params: { project: project_params }
      expect(response).to redirect_to(project_url(Project.last))
    end
  end

  describe 'PUT #update' do
    let!(:project) { create(:project) }

    it 'updates a project' do
      put :update, params: { id: project.id, project: project_params }
      expect(assigns(:project)).to eq(project)
    end

    it 'aborts with invalid params' do
      put :update, params: { id: project.id, project: project_params.merge(name: nil) }
      expect(assigns(:project)).to eq(project)
    end

    it 'redirects to the project page' do
      put :update, params: { id: project.id, project: project_params }
      expect(response).to redirect_to(project_url(project))
    end
  end

  describe 'DELETE #destroy' do
    let!(:project) { create(:project) }
    it 'deletes a project' do
      expect {
        delete :destroy, params: { id: project.id }
      }.to change(Project, :count).by(0)
    end

    it 'redirects to the projects page' do
      delete :destroy, params: { id: project.id }
      expect(response).to redirect_to(projects_url)
    end
  end

  private

  def project_params
    attributes_for(:project).merge(project_owner_id: create(:user).id).except(:project_owner)
  end
end
