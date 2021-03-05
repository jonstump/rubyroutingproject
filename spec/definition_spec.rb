require('definition')
require('word')
require('rspec')
require('pry')

describe '#Definitions' do
  
  describe('#Initialize') do
    it("Initializes the Song Object") do
      word1 = Words.new({:user_word => "photon", :user => "Epsilon", :id => nil})
      definition1 = Definitions.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => @word1.id, :id => nil})
      expect(definition1.class).to(eq(definitions))
    end
  end

end