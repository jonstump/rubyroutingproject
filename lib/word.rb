class Words
  attr_accessor :user_word, :user 
  attr_reader :id

  @@word = {}
  @@total_words = 0

  def initialize(attributes)
    @user = attributes.fetch(:user)
    @word_to_define = attributes.fetch(:user_word)
    @id = attributes.fetch(:id) || @@total_words += 1
  end

  def self.all
    nil
  end





end