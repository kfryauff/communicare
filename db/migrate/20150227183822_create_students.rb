class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :given_name
      t.string :surname
      t.string :image
      t.integer :age
      t.datetime :joined_at

      t.timestamps
    end
  end
end
