class PetsController < ApplicationController
  before_action :set_sub
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = @sub.pets
  end

  def show
  end

  def new
    @pet = @sub.pets.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @pet = @sub.pets.new(pet_params)

    if @pet.save
      redirect_to [@sub, @pet]
    else
      render :new
    end
  end

  def update
    if @pet.update(pet_params)
      redirect_to [@sub, @pet]
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to sub_pets_path(@sub)
  end

  private
    def set_sub
      @sub = Sub.find(params[:sub_id])
    end

    def set_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:name, :body)
    end
end
