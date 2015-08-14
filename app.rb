require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')
require('./lib/word')

get('/') do
  erb(:index)
end

get('/words/new') do
  erb(:words_form)
end

get('/words') do
  @dealerships = Word.all()
  erb(:words)
end

post('/words') do
  name = params.fetch('name')
  Word.new(name).save()
  @words = Word.all()
  erb(:success)
end

get('/definitions/:id') do
  @vehicle = Definition.find(params.fetch('id').to_i())
  @make = @vehicle.make()
  @model = @vehicle.model()
  @year = @vehicle.year()
  erb(:definition)
end
