class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end
  # CRUD
  # Create Read
  get '/recipes' do
    @recette = Recipe.all
    erb :index
  end

  get `/recipes/new` do
    erb :new
  end

  post '/recipes'do
    #binding.pry
    @recette = Recipe.create(params)
    #binding.pry
    redirect to  '/recipes/#{@recette.id}'
  end

  get '/recipes/:id' do
    @recette = Recipe.find_by_id(params[:id])
    #binding.pry
    erb :recipe
  end

  # edit
  # update
  get '/recipes/:id/edit' do
    #binding.pry
    @recette = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    #binding.pry
    @recette = Recipe.find_by_id(params[:id])
    @recette.name = params[:name]
    @recette.ingredients = params[:ingredients]
    @recette.cook_time = params[:cook_time]
    @recette.save
    #binding.pry
    redirect to "/recipes/#{@recette.id}"
  end

  # delete
  get '/recipes/:id/delete' do
    #binding.pry
    @recette = Recipe.find_by_id(params[:id])
    erb :delete
  end

  delete '/recipes/:id/delete' do
    @recette = Recipe.find_by_id(params[:id])
    @recette.delete
    redirect to '/index'
  end



end
