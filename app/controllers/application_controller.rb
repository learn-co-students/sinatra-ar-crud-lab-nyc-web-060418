
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  # ***********

  #index
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  #new post
  get '/posts/new' do
    @post = Post.new
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    redirect "/posts"
  end

  #show post
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end


  #edit post
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update({name: params[:name], content: params[:content]})
    redirect "/posts/#{@post.id}"
  end

  #delete post
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :delete
  end



end
