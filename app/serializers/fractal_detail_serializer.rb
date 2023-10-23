class FractalDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :aspects
end