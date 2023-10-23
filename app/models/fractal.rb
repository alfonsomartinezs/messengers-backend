# frozen_string_literal: true

# The Fractal is the base unit of record keeping; It can be a character, place, etc.
class Fractal < ApplicationRecord
  belongs_to :parent, class_name: 'Fractal', optional: true
  has_many :children, class_name: 'Fractal', foreign_key: 'parent_id'
  has_many :aspects
  has_one_attached :image

  def create_aspect(new_aspect_type, aspect_title)
    type = AspectType.find_or_create_by(name: new_aspect_type.titleize)
    Aspect.create!(title: aspect_title, aspect_type: type, fractal_id: id)
  end

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
