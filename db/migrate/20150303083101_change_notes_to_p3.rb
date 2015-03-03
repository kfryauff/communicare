class ChangeNotesToP3 < ActiveRecord::Migration
  def change
    add_column :notes, :status, :integer, default: 0
  end
end
