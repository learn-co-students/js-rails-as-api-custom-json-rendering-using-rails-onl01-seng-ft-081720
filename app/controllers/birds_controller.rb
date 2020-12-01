class BirdsController < ApplicationController

  def index
    @birds = Bird.all
    # render json: @birds
    # or we could just do an except on the method that we don't want all info in the hash
    # render json: birds, except: [:created_at, :updated_at]
    # simpilist way to accomplish both things. 
    render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id]) #when using .find_by if not found nil will be returned, nill will be assigned to the bird variable if params[:id] does not match a valid id
    # render json: bird
    # setting the hashes attribute so they can be displayed
    # render json: {id: bird.id, name: bird.name, species: bird.species }
    # or use the .slice method on the action
    # render json: bird.slice( :id, :name, :species )
    # .slice works fine for a single hash but wont work for an array of hashes
    # in the case of an array of hashes use only:
    # render json:  birds, only: [:id, :name, :species]

    # basic errors when rendering JSON data
    if bird
      render json: {id: bird.id, name: bird.name, species: bird.species } 
    else
      render json: {message: 'Bird not found'}
    end
  end

end