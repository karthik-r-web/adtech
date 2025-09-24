class Variant
  include Mongoid::Document
  include Mongoid::Timestamps
  searchkick
  belongs_to :product
  has_many :images, as: :imageable
  field :name, type: String
  field :color, type: String
end