class CreateUrlEntries < ActiveRecord::Migration
  def self.up
    create_table :url_entries do |t|
      t.string :key
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :url_entries
  end
end
