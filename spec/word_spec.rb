require('word')
require('rspec')
require('pry')

describe '#Word' do
  before(:each) do
    Word.clear
    Definition.clear
  end

  describe('#Initialize') do
    it("Initializes the Word Object") do
      word1 = Word.new({:user_word => "photon", :user => "Epsilon", :id => nil})
        expect(word1.class).to(eq(Word))
    end
  end
  
  describe('.all') do
    it("returns an empty array when there are no word") do
      expect(Word.all).to(eq([]))
    end
  end
  
  describe('#==') do
    it('is the same word if it has the same attributes of another word') do
      word1 = Word.new({:user_word => "photon", :user => "Epsilon", :id => nil})
      word2 = Word.new({:user_word => "photon", :user => "Epsilon", :id => nil})
      expect(word1).to(eq(word2))
    end
  end
  
  describe('#save') do
    it('will save a user inputted word') do
      word1 = Word.new({:user_word => "zeronium", :user => "Gesicht", :id => nil})
      word1.save
      word2 = Word.new({:user_word => "ambassador", :user => "Atom", :id => nil})
      word2.save
      expect(Word.all).to(eq([word1, word2]))
    end
  end
  
  describe('.clear') do
    it('will clear all word') do
      word1 = Word.new({:user_word => "zeronium", :user => "Gesicht", :id => nil})
      word1.save
      word2 = Word.new({:user_word => "ambassador", :user => "Atom", :id => nil})
      word2.save
      Word.clear
      expect(Word.all).to(eq([]))
    end
  
    describe('.find') do
      it('find a word by its id') do
        word1 = Word.new({:user_word => "zeronium", :user => "Gesicht", :id => nil})
        word1.save
        word2 = Word.new({:user_word => "ambassador", :user => "Atom", :id => nil})
        word2.save
        expect(Word.find(word1.id)).to(eq(word1))
      end
    end

    describe('#update') do
      it("updates a word by id") do
        word1 = Word.new({:user_word => "zeronium", :user => "Gesicht", :id => nil})
        word1.save
        word1.update({:user_word => "photon", :user => "atom"})
        expect(word.user_word).to(eq("photon"))
      end
    end

    describe('#delete') do
      it('deletes a word by its id') do
        word1 = Word.new({:user_word => "zeronium", :user => "Gesicht", :id => nil})
        word1.save
        word2 = Word.new({:user_word => "ambassador", :user => "Atom", :id => nil})
        word2.save
        word1.delete
        expect(Word.all).to(eq([word2]))
      end
    end

    describe('#definition') do
      it("returns a word's defintions") do
        word1 = Word.new({:user_word => "photon", :user => "Epsilon", :id => nil})
        word1.save
        definition1 = Definition.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => word1.id, :definition_id => nil})
        definition1.save
        definition2 = Definition.new({:definition => "Is the individual atoms of a photo", :user => "Atom", :word_id => word1.id, :definition_id => nil})
        definition2.save
        expect(word1.definitions).to(eq([definition1, definition2]))
      end
    end

    describe('.sort') do
      it('will sort word alphabetically') do
        word1 = Word.new({:user_word => "zeronium", :user => "Gesicht", :id => nil})
        word1.save
        word2 = Word.new({:user_word => "ambassador", :user => "Atom", :id => nil})
        word2.save
        expect(Word.word_sort()).to(eq([word2, word1]))
      end
    end

end
end