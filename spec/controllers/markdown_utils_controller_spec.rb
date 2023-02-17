require 'rails_helper'

RSpec.describe MarkdownUtilsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe '#upload' do
    let(:file) { fixture_file_upload('test_image.png', 'image/png') }

    before do
      post :upload, params: { file: file }
    end

    context 'with a valid file' do
      it 'returns a link to the uploaded image' do
        expect(response.body).to eq({ link: test_image_url }.to_json)
      end
    end

    context 'with an invalid file' do
      let(:file) { fixture_file_upload('test_file.pdf', 'text/plain') }

      it 'returns an error' do
        expect(response.body).to eq({ error: 'Something went wrong. You most likely added something that isn\'t an image' }.to_json)
      end
    end
  end
end
