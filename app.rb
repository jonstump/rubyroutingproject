require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

#route for the main page
get ('/') do
  @words = Word.word_sort
  erb(:words)
end

#route for the main page (duplicate of above)
get ('/words') do
  @words = Word.word_sort
  erb(:words)
end

#get route for new words
get('/words/new') do
  erb(:new_words)
end

#post route for new words. Saves params of word and user to words. Also sorts words
post('/words') do
  user = params[:user]
  user_word = params[:word]
  word = Word.new({:user_word => user_word, :user => user, :id => nil})
  word.save()
  @words = Word.word_sort
  erb(:words)
end

#get for individual words page. Also pulls definitions entered by user if any exist
get('/word/:id') do
  @word = Word.find(params[:id].to_i())
  @user_def = Definition.find_by_word(params[:id].to_i)
  @words = Word.word_sort
  erb(:word)
end

#page to edit words
get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

#Update ability on words
patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update({:user_word => params[:word], :user => params[:user], :id => @word.id})
  @words = Word.word_sort
  erb(:words)
end

#allows for a word to be deleted
delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete
  @words = Word.word_sort
  erb(:words)
end

# Definitions--------------

#get for definitions. Pulls by word id and definition id params
get('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  @word = Word.find(params[:id].to_i())
  erb(:definition)
end

#post for definitions of a word. uses params for word id, user, and definition to add to defintions
post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  user_def = Definition.new({:user => params[:user], :definition => params[:definition], :word_id => @word.id, :definition_id => nil})
  user_def.save()
  @user_def = Definition.all
  erb(:word)
end

#updates defintions
patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  user_def = Definition.find(params[:definition_id].to_i)
  user_def.update({:definition => params[:definition], :user => params[:user]})
  @user_def = Definition.find_by_word(params[:id].to_i)
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

#allows for a word to be deleted
delete('/words/:id/definitions/:definition_id') do
  user_def = Definition.find(params[:definition_id].to_i)
  user_def.delete
  @user_def = Definition.find_by_word(params[:id].to_i)
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
