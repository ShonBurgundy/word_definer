require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:homepage)
end

get('/words') do
  @words = Word.all
  erb(:homepage)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  name = params[:word_name]
  word = Word.new({:name => name, :id => nil})
  word.save()
  @words = Word.all()
  erb(:homepage)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  @words = Word.all()
  erb(:homepage)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all()
  erb(:homepage)
end

# -------------- DEFINITION --------------

get('/words/:id/definitions/:definition_id/edit') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:edit_definition)
end

get('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:edit_definition)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new({:clarif => params[:clarif], :word_id => @word.id, :id => nil})
  definition.save()
  erb(:word)
end

patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:clarif], @word.id)
  erb(:word)
end

delete('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
