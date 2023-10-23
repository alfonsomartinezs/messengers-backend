# frozen_string_literal: true

# Fractals are what the rest of the objects are based on -- characters, places, etc.
class Api::V1::FractalsController < ApplicationController
  before_action :set_fractal, only: %i[show update destroy assign_aspect]

  # GET /fractals
  def index
    @fractals = Fractal.all

    render json: @fractals
  end

  # GET /fractals/1
  def show
    render json: @fractal, serializer: FractalDetailSerializer
  end

  # POST /fractals
  def create
    @fractal = Fractal.new(fractal_params)

    if @fractal.save
      render json: @fractal, status: :created, location: @fractal
    else
      render json: @fractal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fractals/1
  def update
    if @fractal.update(fractal_params)
      render json: @fractal
    else
      render json: @fractal.errors, status: :unprocessable_entity
    end
  end

  def assign_aspect
    if @fractal.create_aspect(params[:new_aspect_type], params[:aspect_title])
      render json: @fractal, serializer: FractalDetailSerializer
    else
      render json: @fractal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fractals/1
  def destroy
    @fractal.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fractal
    @fractal = Fractal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def fractal_params
    params.require(:fractal).permit(:name, :description, :image)
  end
end
