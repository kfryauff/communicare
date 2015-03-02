class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :user, index: true
      t.references :student, index: true
      t.text :text
      t.integer :category, default: 0

      t.timestamps
    end
  end
end
