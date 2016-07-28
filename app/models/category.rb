class Category < ActiveRecord::Base
  has_many :items

  validates :name, presence:true, uniqueness: true
  def slug
    name.downcase.tr(' ', '-')
  end

  def to_param
    slug.to_s
  end
end
