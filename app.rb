
require 'sinatra/base'
require_relative './models/link.rb'
require_relative './models/tag.rb'
require_relative './data_mapper_setup.rb'

ENV["RACK_ENV"] ||= "development"

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/links' do
    @links = Link.all
    erb :links
  end

  post '/links' do
    redirect to ('/links/new')
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:name])
    link.tags << tag
    links.save
    redirect to ('/links')
    # erb :links
  end

  get '/links' do
    erb :links
  end
#why do we POST to /links and not /links/new? Why do we GET links/new?

end
