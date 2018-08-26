require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag')
also_reload('../models/*')
require_relative('../models/tag')

#INDEX

get '/tags' do
  @tags = Tag.all
  erb(:'tags/index')
end

# NEW

get '/tags/new' do
  erb(:'tags/new')
end

#CREATE

post '/tags' do
  new_tag = Tag.new(params)
  new_tag.save
  redirect '/tags'
end

#EDIT

get '/tags/:id/edit' do
  @tags = Tag.find_by_id(params[:id])
  erb(:'tags/edit')
end
