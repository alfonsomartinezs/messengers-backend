# frozen_string_literal: true

# Aspect Types are groupings for aspects.
class AspectType < ApplicationRecord
  has_many :aspects
end
