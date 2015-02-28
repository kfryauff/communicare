class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.references :user, index: true
      t.references :student, index: true
      t.integer :topic
      t.text :details

      t.timestamps
    end
  end
end
