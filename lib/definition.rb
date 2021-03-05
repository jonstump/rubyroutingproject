class Definitions
  attr_reader :definition_id
  attr_accessor :definition, :word_id, :user

  @@definitions = {}
  @@definition_id = 0

  def initialize(attributes)
    @user = attributes.fetch(:user)
    @definition = attributes.fetch(:definition)
    @word_id = attributes.fetch(:word_id)
    @definition_id = attributes.fetch(:definition_id) || @@definition_id += 1
  end

  def self.all
    @@definitions.values
  end

  def ==(compare_def)
    self.definition = compare_def.definition
  end

  def save
    @@definitions[self.definition_id] = Definitions.new({:definition => self.definition, :user => self.user, :definition_id => self.definition_id, :word_id => self.word_id})
  end

  def self.clear
    @@definitions = {}
    @@definition_id = 0
  end

  def self.find(definition_id)
    @@definitions[definition_id]
  end

  def delete
    @@definitions.delete(self.definition_id)
  end

  
end