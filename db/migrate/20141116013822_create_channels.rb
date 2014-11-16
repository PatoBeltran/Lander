class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :team_id
      t.string :name
      t.integer :creator_id

      t.timestamps
    end
    add_index :channels, :team_id
    add_index :channels, :creator_id
  end
end
