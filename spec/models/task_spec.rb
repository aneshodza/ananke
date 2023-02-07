require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:project) }
  end

  describe 'associations' do
    it { should belong_to(:project) }
  end

  describe 'scopes' do
    let!(:project) { create(:project) }
    let!(:task) { create(:task, project: project) }
    let!(:task2) { create(:task, project: project) }
    let!(:task3) { create(:task, project: project, finished: true) }

    it 'returns unfinished tasks' do
      expect(Task.unfinished).to eq([task, task2])
    end

    it 'returns finished tasks' do
      expect(Task.finished).to eq([task3])
    end
  end
end
