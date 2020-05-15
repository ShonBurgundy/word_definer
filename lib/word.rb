class Word
  attr_reader :id, :name
  @@total_rows = 0
  @@words = {}

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
   @@words.values()
  end

  def save
    @@words[self.id] = self
  end

  def ==(word_to_compare)
    # code
  end

  def self.clear
    # code
  end

  # def update(name)
  #   # code
  # end

  def self.find(id)
    # code
  end

  def definitions
    # code
  end  
  
  
end  