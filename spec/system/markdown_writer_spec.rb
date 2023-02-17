require 'rails_helper'

RSpec.describe "Markdown write window", type: :system do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

  before do
    sign_in user
    visit edit_task_path(task)
  end
end
