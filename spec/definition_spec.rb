require 'rspec'
require 'pry'
require 'word'
require 'definition'

describe('#Definition') do
  
  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new({:clarif => "joy", :word_id => @id, :id => nil})
      definition1 = Definition.new({:clarif => "joy", :word_id => @id, :id => nil})
      expect(definition).to(eq(definition1))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new({:clarif => "joy", :word_id => @id, :id => nil})
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end
  # describe('.all') do
  #   it("return a list of all definitions") do
      
  #   end
  # end

end