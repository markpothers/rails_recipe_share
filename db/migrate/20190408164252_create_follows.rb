class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.belongs_to :chef
      t.belongs_to :follower, foreign_key: true

      t.timestamps
    end
  end
end
