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

  describe '#safe_tags' do
    it 'returns safe tags' do
      expect(helper.safe_tags).to eq(%w(p br a img h1 h2 h3 h4 h5 h6 ul ol li strong em code pre))
    end
  end

  describe '#safe_attributes' do
    it 'returns safe attributes' do
      expect(helper.safe_attributes).to eq(%w(href src alt))
    end
  end

  describe '#markdown' do
    it 'returns markdown' do
      expect(helper.render_markdown('*test*')).to eq("<p><em>test</em></p>\n")
    end
  end
end
