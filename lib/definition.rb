class Definition
  attr_reader :id
  attr_accessor :clarif, :word_id
  @@total_rows = 0
  @@definitions ={}

  def initialize(attributes)
    @clarif = attributes.fetch(:clarif)
    @word_id = attributes.fetch(:word_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def ==(def_to_compare)
    (self.clarif() == def_to_compare.clarif()) && (self.word_id() == def_to_compare.word_id())
  end

  def save
    @@definitions[@id] = self
  end  

  def self.all
    @@definitions.values()
  end

  def self.clear
    @@definitions = {}
  end
  
  def self.find(id)
    @@definitions[id]
  end

  def update(clarif, word_id)
    @clarif = clarif
    @word_id = word_id
  end

  def delete
    @@definitions.delete(@id)
  end

  def self.find_by_word(wrd_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == wrd_id
        definitions.push(definition)
      end
    end
    definitions
  end

  def word
    Word.find(@word_id)
  end

end  