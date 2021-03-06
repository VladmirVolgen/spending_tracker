require('sinatra')
require('sinatra/contrib/all') if development?
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
  @tag = Tag.find_by_id(params[:id])
  erb(:'tags/edit')
end

#UPDATE

put '/tags/:id' do
  Tag.new(params).update
  redirect '/tags'
end

#DELETE

post '/tags/:id/delete' do
  Tag.delete_by_id(params[:id])
  redirect '/tags'
end
