class Category < ActiveRecord::Base
  has_many :items
  attr_accessor :name


    def slug
      name.downcase.gsub(" ", "-")
    end

    def to_param
      "#{slug}"
    end


end
