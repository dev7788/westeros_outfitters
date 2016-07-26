class Category < ActiveRecord::Base
  has_many :items

  def to_param
    name = name.downcaseend
  end

end
