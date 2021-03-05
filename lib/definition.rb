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
    
  end

end