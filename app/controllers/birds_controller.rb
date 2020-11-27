class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  #this will also work the same as only method
  # def index
  #   birds = Bird.all
  #   render json: birds, except: [:created_at, :updated_at]
  # end
 
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
  #adding the if/else statement to produce an error message

  #will work the same as writing out the key and dot notation above
  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird.slice(:id, :name, :species)
  # end

end
