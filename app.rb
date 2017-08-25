
require 'sinatra/base'
require_relative './models/link.rb'
require_relative './models/tag.rb'

ENV["RACK_ENV"] ||= "development"

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.create(tname: params[:tname])
    link.tags << tag
    redirect '/links'
  end

#why do we POST to /links and not /links/new? Why do we GET links/new?

end
