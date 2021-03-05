require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get ('/') do
  @words = Words.word_sort
  erb(:words)
end

get ('/words') do
  @words = Words.word_sort
  erb(:words)
end

get('/words/new') do
  erb(:new_words)
end

post('/words') do
  user = params[:user]
  user_word = params[:word]
  word = Words.new({:user_word => user_word, :user => user, :id => nil})
  word.save()
  @words = Words.word_sort
  binding.pry
  erb(:words)
end

get('/word/:id') do
  @word = Words.find(params[:id].to_i())
  @words = Words.word_sort
  definition = Definitions.find(params[:definition_id].to_i())
  binding.pry
  erb(:word)
end

post('/words/:id/definitions') do
  @word = Words.find(params[:id].to_i())
  @definition = Definitions.find(params[:definition_id].to_i())
  definition = params[:definition]
  user = params[:user]
  definition = Definitions.new({:definition => definition, :user => user, :word_id => @word.id, :definition_id => nil})
  definition.save()
  binding.pry
  erb(:definition)
end

get('/words/:id/definitions/:definition_id') do
  @definition = Definitions.find(params[:definition_id].to_i())
  @word = Words.find(params[:id].to_i())
  erb(:definition)
end