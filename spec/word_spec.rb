require 'rspec'
require 'pry'
require 'word'

describe ('#Word') do


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
    it("clears all words")
  end
end
