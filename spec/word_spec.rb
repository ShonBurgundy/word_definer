require 'rspec'
require 'pry'
require 'word'

describe ('#Word') do

  describe('#save') do
    it("saves a word that has been created") do
      word = Word.new({:name => "fun", :id => nil})
      word.save()
      word2 = Word.new({:name => "boring", :id => nil})
      word2.save()
      expect(Word.all).to(eq([word,word2]))
    end
  end

end
