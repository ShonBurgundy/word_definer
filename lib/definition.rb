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
    # (self.name() == def_to_compare.name()) && (self.word_id() == def_to_compare.word())
  end



end  