class BirdsController < ApplicationController
  def index
    # Render the ERB view with only: @birds = Bird.all
    # # JSON renders the json object
    # @birds = Bird.all
    # # render json: @birds


    # # JSON does NOT use erb files so it uses local variables (birds) NOT instance variables (@birds)
    # birds = Bird.all
    # render json: birds

    # Renders array of json bird objects with limited info
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]





  end

  def show
    # # Renders a single json bird object
    # bird = Bird.find_by(id: params[:id])
    # render json: bird

    # # Renders limited info of a json bird object
    # bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name } 

    # # Uses slice to render limited info of a json bird object
    # bird = Bird.find_by(id: params[:id])
    # render json: bird.slice(:id, :name, :species)

    # Error message because record does NOT exist
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end


  end






end