require('definition')
require('word')
require('rspec')
require('pry')

describe '#Definition' do
  
  before(:each) do
    Word.clear
    Definition.clear
    @word1 = Word.new({:user_word => "photon", :user => "Epsilon", :id => nil})
    @word1.save
  end

  describe('#Initialize') do
    it("Initializes the Definition Object") do
      definition1 = Definition.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => @word1.id, :definition_id => nil})
      expect(definition1.class).to(eq(Definition))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no word") do
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same definition if it has the same attributes of another definition') do
      definition1 = Definition.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => @word1.id, :definition_id => nil})
      definition2 = Definition.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => @word1.id, :definition_id => nil})
      expect(definition1).to(eq(definition2))
    end
  end

  describe('#save') do
    it('will save a user inputted definition') do
      definition1 = Definition.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => @word1.id, :definition_id => nil})
      definition1.save
      expect(Definition.all).to(eq([definition1]))
    end
  end

  describe('.clear') do
    it('will clear all definition') do
      definition1 = Definition.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => @word1.id, :definition_id => nil})
      definition1.save
      definition2 = Definition.new({:definition => "Is the individual atoms of a photo", :user => "Atom", :word_id => @word1.id, :definition_id => nil})
      definition2.save
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it('find a definition by its id') do
      definition1 = Definition.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => @word1.id, :definition_id => nil})
      definition1.save
      definition2 = Definition.new({:definition => "Is the individual atoms of a photo", :user => "Atom", :word_id => @word1.id, :definition_id => nil})
      definition2.save
      expect(Definition.find(definition1.definition_id)).to(eq(definition1))
    end
  end

  describe('#update') do
    it('updates a definition by id') do
      definition1 = Definition.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => @word1.id, :definition_id => nil})
      definition1.save
      definition1.update({:definition => "The individual atoms of a photograph"})
      binding.pry
      expect(definition1.definition).to(eq("The individual atoms of a photograph"))
    end
  end

  describe('#delete') do
    it('deletes a definition by its id') do
      definition1 = Definition.new({:definition => "Is a sciencey thing", :user => "Epsilon", :word_id => @word1.id, :definition_id => nil})
      definition1.save
      definition2 = Definition.new({:definition => "Is the individual atoms of a photo", :user => "Atom", :word_id => @word1.id, :definition_id => nil})
      definition2.save
      definition1.delete
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it("finds definition for a word") do
      word2 = Word.new({:user_word => "ambassador", :user => "Atom", :id => nil})
      word2.save
      definition1 = Definition.new({:definition => "Is a robot bass", :user => "Epsilon", :word_id => word2.id, :definition_id => nil})
      definition1.save
      definition2 = Definition.new({:definition => "Is the individual atoms of a photo", :user => "Atom", :word_id => @word1.id, :definition_id => nil})
      definition2.save
      expect(Definition.find_by_word(word2.id)).to(eq([definition1]))
    end
  end

end