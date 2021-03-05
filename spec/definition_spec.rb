require('definition')
require('word')
require('rspec')
require('pry')

describe '#Definitions' do
  
  before(:each) do
    Words.clear
    @word1 = Words.new({:user_word => "photon", :user => "Epsilon", :id => nil})
    @word1.save
  end

  describe('#Initialize') do
    it("Initializes the Song Object") do
      definition1 = Definitions.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => @word1.id, :definition_id => nil})
      expect(definition1.class).to(eq(Definitions))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Definitions.all).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same definition if it has the same attributes of another definition') do
      definition1 = Definitions.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => @word1.id, :definition_id => nil})
      definition2 = Definitions.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => @word1.id, :definition_id => nil})
      expect(definition1).to(eq(definition2))
    end
  end



end