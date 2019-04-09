class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.belongs_to :requestor, foreign_key: true
      t.belongs_to :acceptor, foreign_key: true

      t.timestamps
    end
  end
end
