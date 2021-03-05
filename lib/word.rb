class Words
  attr_accessor :user_word, :user 
  attr_reader :id

  @@words = {}
  @@total_words = 0

  def initialize(attributes)
    @user = attributes.fetch(:user)
    @user_word = attributes.fetch(:user_word)
    @id = attributes.fetch(:id) || @@total_words += 1
  end

  def self.all
    @@words.values
  end

  def ==(compare_words)
    self.user_word = compare_words.user_word
  end

  def save
    @@words[self.id] = Words.new({:user_word => self.user_word, :user => self.user, :id => self.id})
  end

  def self.clear
    @@words = {}
    @@total_words = 0
  end

  def self.find(id)
    @@words[id]
  end

  def delete
    @@words.delete(self.id)
  end

  def definitions
    
  end

end