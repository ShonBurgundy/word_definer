require 'rspec'
require 'pry'
require 'word'
require 'definition'

describe ('#Word') do

before(:each) do
  Word.clear()
end  


  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word that has been created") do
      word = Word.new({:name => "fun", :id => nil})
      word.save()
      word2 = Word.new({:name => "boring", :id => nil})
      word2.save()
      expect(Word.all).to(eq([word,word2]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new({:name => "fun", :id => nil})
      word.save()
      word2 = Word.new({:name => "boring", :id => nil})
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another") do
      word = Word.new({:name => "fun", :id => nil})
      word2 = Word.new({:name => "fun", :id => nil})
      expect(word).to(eq(word2))
    end
  end

  describe('.find') do
    it("finds a word") do
      word = Word.new({:name => "fun", :id => nil})
      word.save()
      word2 = Word.new({:name => "boring", :id => nil})
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#definitions') do
    it("returns a words definition") do
      word = Word.new({:name => "fun", :id => nil})
      word.save()
      definition = Definition.new({:clarif => "bliss", :word_id => @id, :id => nil})
      definition.save()
      definition1 = Definition.new({:clarif => "goodtime", :word_id => @id, :id => nil})
      definition1.save()
      expect(word.definitions).to(eq([definition, definition1]))
    end
  end

end
