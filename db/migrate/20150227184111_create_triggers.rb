class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.references :user, index: true
      t.references :student, index: true
      t.integer :topic, default: 0
      t.text :detail

      t.timestamps
    end
  end
end
