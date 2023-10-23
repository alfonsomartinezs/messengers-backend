# frozen_string_literal: true

# the Aspect model associates a fractal with an aspect type, e.g. creating an aspect on a character
class Aspect < ApplicationRecord
  before_validation :capitalize_title
  validates :title, presence: true
  validates :title, uniqueness: { scope: :fractal }
  belongs_to :aspect_type
  belongs_to :fractal

  private

  def capitalize_title
    self.title = title.titleize
  end

  def aspect_type_name
    aspect_type.name
  end
end
