class AddAttachmentToUrlEntries < ActiveRecord::Migration
  def self.up
    add_column :url_entries, :attachment, :string
  end

  def self.down
    remove_column :url_entries, :attachment
  end
end
