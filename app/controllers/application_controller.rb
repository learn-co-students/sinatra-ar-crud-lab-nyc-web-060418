
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #Homepage#
  get '/' do
    @posts = Post.all
    erb :index
  end

  #New Blog Form#
  get '/posts/new' do
    erb :new
  end

  #Index Page#
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  #Create Page#
  post '/posts' do
    @post = Post.create(params)
    redirect to '/posts'
  end

  #Show Page#
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  #Edit Form#
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  #Update Page#
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update({
      name: params[:name],
      content: params[:content],
    })
    redirect "posts/#{@post.id}"
  end

  #Delete Page#
  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @post.delete
    erb :delete
  end

end
