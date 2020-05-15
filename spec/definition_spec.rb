require 'rspec'
require 'pry'
require 'word'
require 'definition'

describe('#Definition') do

  before(:each) do
    Definition.clear()
  end
  
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

  describe('.all') do
    it("return a list of all definitions") do
      definition = Definition.new({:clarif => "joy", :word_id => @id, :id => nil})
      definition.save()
      definition1 = Definition.new({:clarif => "goodtime", :word_id => @id, :id => nil})
      definition1.save()
      expect(Definition.all).to(eq([definition,definition1]))
    end
  end

  describe('.clear') do
    it("clear all definitions") do
      definition = Definition.new({:clarif => "joy", :word_id => @id, :id => nil})
      definition.save()
      definition1 = Definition.new({:clarif => "goodtime", :word_id => @id, :id => nil})
      definition1.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe(".find") do
    it("finds a definition by id") do
      definition = Definition.new({:clarif => "joy", :word_id => @id, :id => nil})
      definition.save()
      definition1 = Definition.new({:clarif => "goodtime", :word_id => @id, :id => nil})
      definition1.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe("#update") do
    it("updates an artist by id") do
      definition = Definition.new({:clarif => "joy", :word_id => @id, :id => nil})
      definition.save()
      definition.update("bliss", @id)
      expect(definition.clarif).to(eq("bliss"))
    end
  end

  describe('#delete') do
    it("deletes an artist by id") do
      definition = Definition.new({:clarif => "joy", :word_id => @id, :id => nil})
      definition.save()
      definition1 = Definition.new({:clarif => "goodtime", :word_id => @id, :id => nil})
      definition1.save()
      definition.delete()
      expect(Definition.all).to(eq([definition1])) +1
    end
  end


end