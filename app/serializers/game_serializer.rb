class GameSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :language, :points, :time, :category
  belongs_to :category
  belongs_to :user
end
