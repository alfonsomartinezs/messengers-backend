# frozen_string_literal: true

class AspectTypesController < ApplicationController
  before_action :set_aspect_type, only: %i[show update destroy]

  # GET /aspect_types
  def index
    @aspect_types = AspectType.all

    render json: @aspect_types
  end

  # GET /aspect_types/1
  def show
    render json: @aspect_type
  end

  # POST /aspect_types
  def create
    @aspect_type = AspectType.new(aspect_type_params)

    if @aspect_type.save
      render json: @aspect_type, status: :created, location: @aspect_type
    else
      render json: @aspect_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /aspect_types/1
  def update
    if @aspect_type.update(aspect_type_params)
      render json: @aspect_type
    else
      render json: @aspect_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /aspect_types/1
  def destroy
    @aspect_type.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_aspect_type
    @aspect_type = AspectType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def aspect_type_params
    params.require(:aspect_type).permit(:name, :description)
  end
end
