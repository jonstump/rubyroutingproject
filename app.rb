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