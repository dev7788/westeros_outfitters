class Category < ActiveRecord::Base
  has_many :items
  # attr_accessor :name

  # def slug
  #   name.downcase.tr(' ', '-')
  # end
  #
  # def to_param
  #   slug.to_s
  # end
end
