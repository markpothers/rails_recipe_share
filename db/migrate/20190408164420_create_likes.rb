class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.belongs_to :chef
      t.belongs_to :recipe

      t.timestamps
    end
  end
end
