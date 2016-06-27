class List < ActiveRecord::Base
  
  require 'securerandom'
  require 'base64'

  has_many :recipes
  accepts_nested_attributes_for :recipes, allow_destroy: true
  #before_create :generate_random_id

  private
    def generate_random_id
      self.id = Base64.encode64(SecureRandom.uuid)[0..10]
    end 

end
