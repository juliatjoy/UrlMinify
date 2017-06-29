require 'rails_helper'

describe Link, type: :model do
  let(:link) { build(:link) }

  describe 'Blank url' do
    it 'is to be invalid' do
      link.url = nil
      expect(link).to be_invalid
    end
  end

  describe 'Should call before_create method' do
    it "should be successful" do
      expect{ link.save }.to change{ link.slug }
    end
  end

end
