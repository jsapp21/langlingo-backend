class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :language
  has_many :games
end
