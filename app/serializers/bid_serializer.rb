class BidSerializer < ActiveModel::Serializer
  attributes :id, :price
  belongs_to :user
end
