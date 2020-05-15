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
    @@definitions[self.id] = self
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
    self.clarif = clarif
    self.word_id = word_id
  end

  def delete
    # @@definitions.delete(self.id)
  end

end  