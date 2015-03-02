class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.references :user, index: true
      t.references :student, index: true
      t.integer :duration
      t.integer :topic, default: 0
      t.integer :result, default: 0
      t.datetime :occurred_at

      t.timestamps
    end
  end
end
