class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  extend ProductConserns


  has_many :variants
  has_many :images,as: :imageable

  field :name, type: String
  field :price, type: String
  #
  # def search
  #   Product.search("*", where: {in_stock: true}, limit: 10, offset: 50)
  # end
  # def exception
  #   begin
  #     b="12"
  #     a= b/2.0
  #   rescue => e
  #     puts e
  #   end
  # end

  # more fields...
end
