class AddListRefToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :list, index: true, foreign_key: true
  end
end
