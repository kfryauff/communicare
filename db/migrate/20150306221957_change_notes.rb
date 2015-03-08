class ChangeNotes < ActiveRecord::Migration
  def change
    add_column :notes, :importance, :integer, default: 0
    add_column :notes, :mood, :integer, default: 0
    add_column :notes, :privacy_status, :integer, default: 0
    rename_column :notes, :status, :resolution
  end
end
