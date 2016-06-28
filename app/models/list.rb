class List < ActiveRecord::Base
  
  has_many :recipes
  accepts_nested_attributes_for :recipes, allow_destroy: true
  before_create :generate_random_id

  private
    def generate_random_id
      begin
        self.id = SecureRandom.random_number(1_000_000)
      end while List.where(id: self.id).exists?
    end

end
