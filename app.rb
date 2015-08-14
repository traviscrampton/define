require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')
require('./lib/word')
require('pry')

get('/') do
  erb(:index)
end

get('/words/new') do
  erb(:words_form)
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

post('/words') do
  name = params.fetch('name')
  Word.new(name).save()
  @words = Word.all()
  erb(:success)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id').to_i())
  @define = @definition.define()
  erb(:definition)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/vehicles/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word_definition_form)
end

post('/definitions') do
  define = params.fetch('define')
  @definition = Definition.new(define)
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:success)
end
