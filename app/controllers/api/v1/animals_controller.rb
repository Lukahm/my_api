class Api::V1::AnimalsController < ApplicationController
	before_action :set_animal, only: [:show, :update, :destroy]

  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.all
    render json: @animals if stale?(etag: @animals.all, last_modified: @animals.maximum(:updated_at))
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
  	render json: @animal if stale?(@animal)
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
      if @animal.save
        format.json { render json: @animal, status: :created }
      else
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.json { render json: @animal, status: :ok}
      else
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      params.require(:animal).permit(:name, :number)
    end
end