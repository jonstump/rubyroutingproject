class Word
  attr_accessor :user_word, :user 
  attr_reader :id

  #create an empty hash for words and a counter for ID numbers
  @@words = {}
  @@total_words = 0

  # Instantiates a word hash
  def initialize(attributes)
    @user = attributes[:user]
    @user_word = attributes[:user_word]
    @id = attributes[:id] || @@total_words += 1
  end

  #brings up all values in the word hash
  def self.all
    @@words.values
  end

  #compares words to see if they are the same
  def ==(compare_words)
    self.user_word = compare_words.user_word
  end

  #saves the words based on an id
  def save
    @@words[self.id] = Word.new({:user_word => self.user_word, :user => self.user, :id => self.id})
  end

  #clears the word hash of all values
  def self.clear
    @@words = {}
    @@total_words = 0
  end

  #finds word based on id
  def self.find(id)
    @@words[id]
  end

  #updates a word based on id
  def update(attr)
    user = attr.fetch(:user)
    user_word = attr.fetch(:user_word)
    @@words[self.id] = Word.new({:user_word => user_word, :user => user, :id => self.id})
  end

  #deletes a word based on id
  def delete
    @@words.delete(self.id)
  end

  #finds defintions created by the definition class by word id
  def definitions
    Definition.find_by_word(self.id)
  end

  #sords words alphabetically
  def self.word_sort()
    @@words.values.sort_by { |word| [word.user_word]}
  end

end