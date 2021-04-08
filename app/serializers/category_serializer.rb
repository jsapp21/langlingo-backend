class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :images
  has_many :words 
end
