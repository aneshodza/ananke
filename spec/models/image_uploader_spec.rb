require 'rails_helper'

RSpec.describe ImageUploader do
  describe '#upload' do
    let(:file) { fixture_file_upload('test_image.png', 'image/png') }
    let(:uploader) { described_class.new(file, 'test') }

    it 'uploads the file to the correct path' do
      expect(uploader.upload).to eq(test_image_url('test'))
    end
  end
end
