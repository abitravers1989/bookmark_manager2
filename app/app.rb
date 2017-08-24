
require 'sinatra/base'
require_relative './models/link.rb'


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
    # Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

#why do we POST to /links and not /links/new? Why do we GET links/new?

end
