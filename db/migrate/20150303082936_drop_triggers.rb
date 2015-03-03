class DropTriggers < ActiveRecord::Migration
  def change
    drop_table :triggers
  end
end
