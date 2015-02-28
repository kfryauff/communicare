class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :student, index: true
      t.integer :status
      t.integer :category
      t.text :text

      t.timestamps
    end
  end
end
