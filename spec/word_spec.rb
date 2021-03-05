require('word')
require('rspec')
require('pry')

describe '#Words' do
  before(:each) do
    Words.clear
    Definitions.clear
  end

  describe('#Initialize') do
    it("Initializes the Word Object") do
      word1 = Words.new({:user_word => "photon", :user => "Epsilon", :id => nil})
        expect(word1.class).to(eq(Words))
    end
  end
  
  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Words.all).to(eq([]))
    end
  end
  
  describe('#==') do
    it('is the same word if it has the same attributes of another word') do
      word1 = Words.new({:user_word => "photon", :user => "Epsilon", :id => nil})
      word2 = Words.new({:user_word => "photon", :user => "Epsilon", :id => nil})
      expect(word1).to(eq(word2))
    end
  end
  
  describe('#save') do
    it('will save a user inputted word') do
      word1 = Words.new({:user_word => "zeronium", :user => "Gesicht", :id => nil})
      word1.save
      word2 = Words.new({:user_word => "ambassador", :user => "Atom", :id => nil})
      word2.save
      expect(Words.all).to(eq([word1, word2]))
    end
  end
  
  describe('.clear') do
    it('will clear all words') do
      word1 = Words.new({:user_word => "zeronium", :user => "Gesicht", :id => nil})
      word1.save
      word2 = Words.new({:user_word => "ambassador", :user => "Atom", :id => nil})
      word2.save
      Words.clear
      expect(Words.all).to(eq([]))
    end
  
    describe('.find') do
      it('find a word by its id') do
        word1 = Words.new({:user_word => "zeronium", :user => "Gesicht", :id => nil})
        word1.save
        word2 = Words.new({:user_word => "ambassador", :user => "Atom", :id => nil})
        word2.save
        expect(Words.find(word1.id)).to(eq(word1))
      end
    end

    describe('#delete') do
      it('deletes a word by its id') do
        word1 = Words.new({:user_word => "zeronium", :user => "Gesicht", :id => nil})
        word1.save
        word2 = Words.new({:user_word => "ambassador", :user => "Atom", :id => nil})
        word2.save
        word1.delete
        expect(Words.all).to(eq([word2]))
      end
    end

    describe('#definitions') do
      it("returns a word's defintions") do
        word1 = Words.new({:user_word => "photon", :user => "Epsilon", :id => nil})
        word1.save
        definition1 = Definitions.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => word1.id, :definition_id => nil})
        definition1.save
        definition2 = Definitions.new({:definition => "Is the individual atoms of a photo", :user => "Atom", :word_id => word1.id, :definition_id => nil})
        definition2.save
        expect(word1.definitions).to(eq([definition1, definition2]))
      end
    end

end
end