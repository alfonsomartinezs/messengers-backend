class StaticController < ApplicationController
  def welcome
    render json: { message: 'hello world' }
  end
end
