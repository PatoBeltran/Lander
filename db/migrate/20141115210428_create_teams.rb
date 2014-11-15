class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :subdomain

      t.timestamps
    end
    add_index :teams, :subdomain, unique: true
  end
end
