class Recipe < ActiveRecord::Base

  belongs_to :list
  has_and_belongs_to_many :ingredients

end
