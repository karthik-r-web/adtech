class Image
include Mongoid::Timestamps
  include Mongoid::Document


  belongs_to :imageable, :polymorphic => true
end