require 'spec_helper'

describe Atelier do
  
  describe 'published scope' do
    before do
      @published = FactoryBot.create(:atelier, published: true)
      @unpublished = FactoryBot.create(:atelier, published: false)
    end
    
    it 'finds published items' do
      expect(Atelier.published).to include(@published)
    end
    
    it 'omits unpublished items' do
      expect(Atelier.published).not_to include(@unpublished)
    end

  end
  

end
