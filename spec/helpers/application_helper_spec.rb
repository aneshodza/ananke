require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#absolute_link' do
    it 'returns nil if link starts with http' do
      expect(helper.absolute_link('http://example.com')).to eq('http://example.com')
    end

    it 'returns link with https if link does not start with http' do
      expect(helper.absolute_link('example.com')).to eq('https://example.com')
    end
  end

  describe '#alerts_classes' do
    it 'returns alert classes' do
      expect(helper.alerts_classes('success')).to eq('alert alert-success alert-dismissible fade show')
    end
  end
end
