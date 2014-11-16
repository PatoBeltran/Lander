class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.text :url
      t.integer :team_id
      t.integer :user_id
      t.integer :channel_id

      t.timestamps
    end
    add_index :links, :team_id
    add_index :links, :user_id
    add_index :links, :channel_id
  end
end
