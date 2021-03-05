require('word')
require('rspec')

describe('#Initialize') do
  it("Initializes the Word Object") do
    word = Word.new({:user_word => "zeronium", :user => "Gesicht", :id => nil})
      expect(word.class).to(eq(Word))
  end
end