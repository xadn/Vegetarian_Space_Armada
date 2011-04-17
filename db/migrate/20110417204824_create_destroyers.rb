class CreateDestroyers < ActiveRecord::Migration
  def self.up
    create_table :destroyers do |t|
      t.string :name
      t.float :price
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :destroyers
  end
end
