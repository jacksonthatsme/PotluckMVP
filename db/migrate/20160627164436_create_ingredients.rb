class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|

      t.string :amount
      t.string :unit
      t.string :name

      t.timestamps null: false
    end
  end
end
