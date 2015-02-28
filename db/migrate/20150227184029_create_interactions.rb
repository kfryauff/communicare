class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.references :user, index: true
      t.references :student, index: true
      t.integer :duration
      t.integer :topic
      t.integer :result
      t.datetime :occurred_at

      t.timestamps
    end
  end
end
