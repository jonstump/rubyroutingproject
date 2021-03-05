require('word')
require('rspec')

describe('#Initialize') do
  it("Initializes the Word Object") do
    word = Words.new({:user_word => "zeronium", :user => "Gesicht", :id => nil})
      expect(word.class).to(eq(Words))
  end
end

describe('.all') do
  it("returns an empty array when there are no words") do
    expect(Words.all).to(eq([]))
  end
end

describe('#save') do
  it('will save a user inputted word') do
    word1 = Words.new({:user_word => "zeronium", :user => "Gesicht", :id => nil})
    word2 = Words.new({:user_word => "ambassador", :user => "Atom", :id => nil})
    expect(Words.all).to(eq([word1, word2]))
  end
end