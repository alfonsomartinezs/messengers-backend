# frozen_string_literal: true

# The Fractal is the base unit of record keeping; It can be a character, place, etc.
class Fractal < ApplicationRecord
  belongs_to :parent, class_name: 'Fractal', optional: true
  has_many :children, class_name: 'Fractal', foreign_key: 'parent_id'
end
