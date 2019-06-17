class ApplicationController < Sinatra::Base
  require 'pry'
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Display all recipes
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # Creates one recipe
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  # Displays create recipe form
  get '/recipes/new' do
      erb :new
  end

  # Displays one recipe based on ID in the url
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  # Displays edit form based on ID in the url
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  # Modifies an existing recipe based on ID in the url
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  # Deletes one recipe based on ID in the url
  delete '/recipes/:id/delete' do
    recipe = Recipe.find(params[:id])
    recipe.delete
    redirect to '/recipes'
  end

end