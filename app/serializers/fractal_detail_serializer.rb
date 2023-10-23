class FractalDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url
  has_many :aspects
end
