
require 'sinatra/base'
require_relative './models/link.rb'


class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :creating_links
  end

  post '/links' do
    sessions[:url] = params[:url]
    sessions[:title] = params[:title]
    erb :creating_links
  end

#why do we POST to /links and not /links/new? Why do we GET links/new?

end
