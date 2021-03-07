class Definitions
  attr_reader :definition_id
  attr_accessor :definition, :word_id, :user

  # creats an empty hash for definitions and a definition id counter
  @@definitions = {}
  @@definition_id = 0

  #instantiates a definitions hash
  def initialize(attributes)
    @user = attributes.fetch(:user)
    @definition = attributes.fetch(:definition)
    @word_id = attributes.fetch(:word_id)
    @definition_id = attributes.fetch(:definition_id) || @@definition_id += 1
  end

  #finds all values in definitions
  def self.all
    @@definitions.values
  end

  #compares definitions based on the definition itself and the word id
  def ==(compare_def)
    (self.definition() == compare_def.definition()) && (self.word_id() == compare_def.word_id())
  end

  #saves a definition in the definitions hash
  def save
    @@definitions[self.definition_id] = Definitions.new({:definition => self.definition, :user => self.user, :definition_id => self.definition_id, :word_id => self.word_id})
  end

  #clears the definitions hash of all values and resets the id counter
  def self.clear
    @@definitions = {}
    @@definition_id = 0
  end

  #finds a definition by the id
  def self.find(definition_id)
    @@definitions[definition_id]
  end

  #deletes a definition by the id
  def delete
    @@definitions.delete(self.definition_id)
  end

  #finds definitions by the wrods id and puts all of them into a new array. 
  def self.find_by_word(words_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == words_id
        definitions << definition
      end
    end
    definitions
  end
end