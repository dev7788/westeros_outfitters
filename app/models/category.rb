class Category < ActiveRecord::Base
  has_many :items
  
  def slug
    name.downcase.tr(' ', '-')
  end

  def to_param
    slug.to_s
  end
end
