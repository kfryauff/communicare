class CreateStudentsUsersJoinTable < ActiveRecord::Migration
  def change
  	create_table :students_users, id: false do |t|
  		t.integer :student_id
  		t.integer :user_id
  	end

  	add_index :students_users, :student_id
  	add_index :students_users, :user_id
  end
end
