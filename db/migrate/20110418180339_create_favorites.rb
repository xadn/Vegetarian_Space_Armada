class CreateFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.user_id :integer
      t.destroyer_id :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :favorites
  end
end
