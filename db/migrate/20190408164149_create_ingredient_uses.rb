class CreateIngredientUses < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_uses do |t|
      t.belongs_to :recipe
      t.belongs_to :ingredient
      t.float :quantity
      t.string :unit

      t.timestamps
    end
  end
end
