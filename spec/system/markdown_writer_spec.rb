require 'rails_helper'

RSpec.describe "Markdown write window", type: :system, js: true do
  let(:user) { create(:user) }
  let(:task) { create(:task, creator: user) }

  before do
    sign_in user
    visit edit_task_path(task)
  end

  describe "image upload function" do
    it "can upload an image" do
      file_input = page.find('input[type="file"]', visible: false)
      file_input.execute_script("this.style.display='block';")
      file_input.set(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png').to_s)
      sleep 0.1
      page.find('[type="submit"]').click
      expect(page).to have_css("img[src*=\"#{test_image_url}\"]")
    end
  end
end
