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
  erb(:words)
end

get('/wordss/:id') do
  @word = Words.find(params[:id].to_i())
  @words = Words.word_sort
  erb(:album)
end